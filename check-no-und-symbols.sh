#!/bin/bash
set -x
cc -nostdlib -nodefaultlibs -lgcc -nostdinc -o /tmp/a.o build/libd-rlib.a
if nm --undefined-only /tmp/a.o | grep 'U' | grep -v '_start'; then
    echo "found missing symbols..."
    exit 1
else
    exit 0
fi
