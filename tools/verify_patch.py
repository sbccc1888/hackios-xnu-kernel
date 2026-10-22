#!/usr/bin/env python3
"""Validate every hunk header in xnu/redwood.patch against the lines it actually carries.

WHY THIS EXISTS. xnu/apply.sh runs `git apply --whitespace=nowarn`, which does refuse a malformed
hunk -- but the failure this port actually suffered once was different: a change went missing while
the build stayed green. A hunk header whose stated line count does not match its body is exactly how
that happens, silently, and it is invisible in a diff review because both halves look fine on their
own.

Every hunk is checked: the `-old,count +new,count` in the @@ line is compared with the number of
context/deletion/addition lines that follow it, up to the next hunk or file. A trailing empty line
from splitting is not counted as context.

usage: tools/verify_patch.py [PATCH]     (default: xnu/redwood.patch beside this file's parent)
"""
import os
import re
import sys

patch = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(os.path.abspath(__file__)), os.pardir, "xnu", "redwood.patch")

lines = open(patch, "r", encoding="utf-8", errors="surrogateescape").read().split("\n")

hunk_re = re.compile(r"^@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@")
bad, checked, current_file = [], 0, None

i = 0
while i < len(lines):
    line = lines[i]
    if line.startswith("diff --git "):
        current_file = line.split(" b/")[-1]
    m = hunk_re.match(line)
    if not m:
        i += 1
        continue

    old_n = int(m.group(2)) if m.group(2) is not None else 1
    new_n = int(m.group(4)) if m.group(4) is not None else 1

    old_c = new_c = 0
    j = i + 1
    while j < len(lines):
        l = lines[j]
        if l.startswith("diff --git ") or hunk_re.match(l):
            break
        if l.startswith("\\"):          # "\ No newline at end of file"
            j += 1
            continue
        if l.startswith("+"):
            new_c += 1
        elif l.startswith("-"):
            old_c += 1
        elif l.startswith(" ") or l == "":
            if l == "" and j == len(lines) - 1:
                break
            old_c += 1
            new_c += 1
        else:
            break
        j += 1

    checked += 1
    if (old_c, new_c) != (old_n, new_n):
        bad.append((current_file, m.group(0), (old_n, new_n), (old_c, new_c)))
    i = j

print(f"hunks checked: {checked}")
if bad:
    print(f"MISMATCHES: {len(bad)}")
    for f, hdr, want, got in bad:
        print(f"  {f}\n    header {hdr}\n"
              f"    header says -{want[0]} +{want[1]}, lines carry -{got[0]} +{got[1]}")
    sys.exit(1)
print("every hunk header matches the lines it carries")
