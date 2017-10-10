#!/bin/bash
prefix="orig"
if [ "x${1}" != "x" ]; then
  prefix="$1"
fi

# CPU statistics
sar -P ALL 1 > ${prefix}_cpu.txt &

# network statistics
sar -n DEV 1 > ${prefix}_network.txt &

# memory statistics
sar -r 1 > ${prefix}_memory.txt &

# Context switches statistics
sar -w 1 > ${prefix}_cs.txt &

# IO statistics
iostat -x -k 1 > ${prefix}_io.txt &
