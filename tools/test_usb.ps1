# Run one chiron USB test end to end, from a boot image to decoded results.
#
# The whole sequence has been done by hand many times tonight, and every hand-run has had at
# least one mistake in it: a stale image, a logfs that was not cleared so the previous run's
# output came back, or `fastboot boot` returning before the loader had written anything.
# This script exists so the run that finally gets hardware time does not spend that time on
# the plumbing.
#
# Usage:
#   .\test_usb.ps1 -Image E:\ios-sweat\USB_A.img
#   .\test_usb.ps1 -Image E:\ios-sweat\USB_A.img -Wait 120
#
# What it does:
#   1. waits for a device to appear in fastboot or adb, within a timeout
#   2. if adb is up, clears logfs so a failed run cannot be confused with the last one
#   3. fastboot boot the image
#   4. polls fastboot for the device, so enumeration is noticed the moment it happens
#   5. waits for android to come back (the loader resets when the session ends)
#   6. reads logfs and decodes the lines that decide the diagnosis
#
# Exit codes: 0 device enumerated, 1 ran but did not enumerate, 2 no device to start with.

param(
    [Parameter(Mandatory = $true)][string]$Image,
    [Parameter(Mandatory = $true)][string]$FastbootPath,
    [Parameter(Mandatory = $true)][string]$AdbPath,
    [string]$Serial = '41bc0f2d',
    [int]$Wait = 300,
    [int]$SessionSeconds = 90
)

$ErrorActionPreference = 'Stop'
# Tool paths arrive as arguments.  A CJK path written inside a .ps1 is mangled by the
# encoding Windows PowerShell reads the file with, which presents as "not recognized as
# the name of a cmdlet" pointing at a garbled directory.
$fastboot = $FastbootPath
$adb      = $AdbPath
$serial   = $Serial

function Say($msg) { Write-Host "  $msg" }

function Wait-ForDevice([int]$seconds, [string]$what) {
    $deadline = (Get-Date).AddSeconds($seconds)
    while ((Get-Date) -lt $deadline) {
        $fb = & $fastboot devices 2>$null | Where-Object { $_ -match $serial }
        if ($fb) { return 'fastboot' }
        $ad = & $adb devices 2>$null | Where-Object { $_ -match $serial }
        if ($ad) { return 'adb' }
        Start-Sleep -Milliseconds 500
    }
    Write-Host "  no device after $seconds s ($what)"
    return $null
}

Write-Host "=== test $Image ==="

if (-not (Test-Path $Image)) {
    Write-Host "  image not found: $Image"
    exit 2
}
$len = (Get-Item $Image).Length
Say ("image: {0} bytes, built {1}" -f $len, (Get-Item $Image).LastWriteTime)

# ---- 1. wait for the phone ----------------------------------------------------
$mode = Wait-ForDevice $Wait 'initial'
if (-not $mode) {
    Write-Host "  -> nothing to test against; connect the phone and try again"
    exit 2
}
Say "device present in $mode"

# ---- 2. clear logfs so the next read cannot be stale --------------------------
if ($mode -eq 'adb') {
    Say 'clearing logfs'
    & $adb -s $serial shell su -c 'dd if=/dev/zero of=/dev/block/sda10 bs=4096 count=64' 2>$null | Out-Null
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
    $fb = & $fastboot devices 2>$null | Where-Object { $_ -match $serial }
    $ad = & $adb devices 2>$null | Where-Object { $_ -match $serial }

    $state = if ($fb) { 'fastboot' } elseif ($ad) { 'adb' } else { 'none' }
    if (-not $seen.ContainsKey($state)) {
        $seen[$state] = (Get-Date).ToString('HH:mm:ss')
        Say ("{0}  {1}" -f $seen[$state], $state)
    }
    if ($fb) { $enumerated = $true; break }
    if ($ad) { break }
    Start-Sleep -Milliseconds 500
}

# ---- 5. wait for android to come back so logfs can be read --------------------
if (-not (& $adb devices 2>$null | Where-Object { $_ -match $serial })) {
    Say 'waiting for android to come back (the loader resets when the session ends)'
    $null = Wait-ForDevice 240 'reboot'
}

# ---- 6. read and decode ------------------------------------------------------
if (-not (& $adb devices 2>$null | Where-Object { $_ -match $serial })) {
    Write-Host '  android did not come back; cannot read logfs'
    exit 1
}

Say 'reading logfs'
$raw = & $adb -s $serial shell su -c 'dd if=/dev/block/sda10 bs=4096 count=1024' 2>$null
if (-not $raw) {
    Write-Host '  logfs read returned nothing'
    exit 1
}

# binary to text: keep only printable runs
$bytes = [byte[]]($raw -split '\s+' | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [byte]$_ })
$text = -join ($bytes | ForEach-Object {
    if ($_ -eq 10) { "`n" }
    elseif ($_ -ge 32 -and $_ -lt 127) { [char]$_ }
    else { '' }
})

Write-Host ''
Write-Host '=== decisive lines ==='
$patterns = @{
    'pick'      = 'pick: chose'
    'fnio'      = 'fnio on it'
    'chosen'    = 'from chosen handle'
    'firsth'    = 'from first handle'
    'devten'    = 'devten driver had'
    'ring'      = 'ring adr'
    'norin'     = 'NO EVENT RING'
    'late'      = 'late: '
    'run'       = 'driver left the core'
    'pumped'    = 'pre-loop pumped'
    'different' = 'DIFFERENT controller'
    'serial'    = 'serial: '
    'fail'      = 'start failed'
}
foreach ($key in ($patterns.Keys | Sort-Object)) {
    $m = $text -split "`n" | Where-Object { $_ -match [regex]::Escape($patterns[$key]) }
    foreach ($line in $m) { Write-Host ("  {0,-10} {1}" -f $key, $line.Trim()) }
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
