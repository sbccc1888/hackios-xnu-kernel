# Run one chiron USB test end to end, from a boot image to decoded results.
#
# Every hand-run of this sequence tonight had at least one mistake in it: a stale image, a logfs
# that was not cleared so the previous run's output came back, or fastboot returning before the
# loader had written anything.  This script exists so the run that finally gets hardware time
# does not spend that time on plumbing.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File test_usb.ps1 `
#       -Image E:\ios-sweat\USB_A.img `
#       -FastbootPath "C:\Program Files (x86)\搞机助手\fastboot.exe" `
#       -AdbPath "C:\Program Files (x86)\搞机助手\adb.exe"
#
# Exit codes: 0 enumerated, 1 ran but did not enumerate, 2 could not run.

param(
    [Parameter(Mandatory = $true)][string]$Image,
    [Parameter(Mandatory = $true)][string]$FastbootPath,
    [Parameter(Mandatory = $true)][string]$AdbPath,
    [string]$Serial = '41bc0f2d',
    [int]$Wait = 300,
    [int]$SessionSeconds = 90
)

$ErrorActionPreference = 'Stop'

# Tool paths arrive as arguments.  A CJK path written inside a .ps1 is mangled by the encoding
# Windows PowerShell reads the file with, which presents as "not recognized as the name of a
# cmdlet" pointing at a garbled directory.
$fastboot = $FastbootPath
$adb      = $AdbPath
$serial   = $Serial

function Say($msg) { Write-Host "  $msg" }

function Get-AdbState {
    $line = & $adb devices 2>$null | Where-Object { $_ -match $serial }
    if (-not $line) { return 'absent' }
    if ($line -match 'unauthorized') { return 'unauthorized' }
    if ($line -match 'offline') { return 'offline' }
    if ($line -match '\sdevice\s*$') { return 'device' }
    return 'unknown'
}

function Get-FastbootState {
    $line = & $fastboot devices 2>$null | Where-Object { $_ -match $serial }
    if (-not $line) { return 'absent' }
    if ($line -match 'fastboot') { return 'fastboot' }
    return 'unknown'
}

function Wait-ForDevice([int]$seconds, [string]$what) {
    $deadline = (Get-Date).AddSeconds($seconds)
    $lastSaid = ''
    while ((Get-Date) -lt $deadline) {
        if ((Get-FastbootState) -eq 'fastboot') { return 'fastboot' }

        $st = Get-AdbState
        if ($st -eq 'device') { return 'adb' }

        # Say it when it changes, so unauthorized is not mistaken for "no phone there".
        if ($st -ne $lastSaid -and $st -ne 'absent') {
            $lastSaid = $st
            Write-Host "  adb reports '$st' -- waiting"
        }
        Start-Sleep -Milliseconds 500
    }
    Write-Host "  no usable device after $seconds s ($what)"
    return $null
}

Write-Host "=== test $Image ==="

if (-not (Test-Path $Image)) {
    Write-Host "  image not found: $Image"
    exit 2
}
Say ("image: {0} bytes, built {1}" -f (Get-Item $Image).Length, (Get-Item $Image).LastWriteTime)

# ---- 1. wait for the phone ----------------------------------------------------
$mode = Wait-ForDevice $Wait 'initial'
if (-not $mode) {
    Write-Host "  -> nothing to test against"
    exit 2
}
Say "device present in $mode"

# ---- 2. clear logfs, and refuse to continue if that fails ---------------------
if ($mode -eq 'adb') {
    Say 'clearing logfs'
    $out = & $adb -s $serial shell su -c 'dd if=/dev/zero of=/dev/block/sda10 bs=4096 count=64' 2>&1
    if ($LASTEXITCODE -ne 0) {
        # A silent failure here means the next read returns the PREVIOUS run's log, which looks
        # exactly like a fresh result.  Better to refuse than to be misleading.
        Write-Host "  logfs clear failed: $out"
        Write-Host "  refusing to continue: a stale log is indistinguishable from a new one"
        exit 2
    }
}
else {
    Say 'in fastboot, cannot clear logfs from here (expected if the last run failed)'
}

# ---- 3. boot it ---------------------------------------------------------------
Say 'fastboot boot'
$out = & $fastboot -s $serial boot $Image 2>&1
$out | ForEach-Object { Write-Host "    $_" }

# ---- 4. watch for enumeration -------------------------------------------------
Write-Host "  watching $SessionSeconds s for enumeration"
$enumerated = $false
$deadline = (Get-Date).AddSeconds($SessionSeconds)
$seen = @{}
while ((Get-Date) -lt $deadline) {
    $fb = (Get-FastbootState) -eq 'fastboot'
    $ad = (Get-AdbState) -eq 'device'

    $state = 'none'
    if ($fb) { $state = 'fastboot' }
    elseif ($ad) { $state = 'adb' }

    if (-not $seen.ContainsKey($state)) {
        $seen[$state] = (Get-Date).ToString('HH:mm:ss')
        Say ("{0}  {1}" -f $seen[$state], $state)
    }
    if ($fb) { $enumerated = $true; break }
    if ($ad) { break }
    Start-Sleep -Milliseconds 500
}

# ---- 5. wait for android, so logfs can be read --------------------------------
if ((Get-AdbState) -ne 'device') {
    Say 'waiting for android (the loader resets when the session ends)'
    $null = Wait-ForDevice 240 'reboot'
}

if ((Get-AdbState) -ne 'device') {
    Write-Host '  android did not come back; cannot read logfs'
    exit 1
}

# ---- 6. read and decode ------------------------------------------------------
Say 'reading logfs'
$raw = & $adb -s $serial shell su -c 'dd if=/dev/block/sda10 bs=4096 count=1024' 2>$null
if (-not $raw) {
    Write-Host '  logfs read returned nothing'
    exit 1
}

$bytes = [byte[]]($raw -split '\s+' | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [byte]$_ })
$text = -join ($bytes | ForEach-Object {
    if ($_ -eq 10) { "`n" }
    elseif ($_ -ge 32 -and $_ -lt 127) { [char]$_ }
    else { '' }
})

Write-Host ''
Write-Host '=== decisive lines ==='
$patterns = [ordered]@{
    pick      = 'pick: chose'
    fnio      = 'fnio on it'
    chosen    = 'from chosen handle'
    firsth    = 'from first handle'
    devten    = 'devten driver had'
    ring      = 'ring adr'
    norin     = 'NO EVENT RING'
    ssphy     = 'ssphy_if'
    ghw       = 'ghw3'
    lpm       = 'LPM cap'
    autor     = 'auto-resume 0xB8'
    pllres    = 'pll autopgm'
    r210      = 'r210'
    late      = 'late: '
    run       = 'driver left the core'
    reassert  = 'reasserted speed bits'
    pumped    = 'pre-loop pumped'
    different = 'DIFFERENT controller'
    serialnum = 'serial: '
    fail      = 'start failed'
}
foreach ($key in $patterns.Keys) {
    $m = $text -split "`n" | Where-Object { $_ -match [regex]::Escape($patterns[$key]) }
    foreach ($line in $m) { Write-Host ("  {0,-9} {1}" -f $key, $line.Trim()) }
}

Write-Host ''
if ($enumerated) {
    Write-Host '  RESULT: enumerated -- fastboot saw the device'
    exit 0
}
else {
    Write-Host '  RESULT: ran, did not enumerate'
    exit 1
}
