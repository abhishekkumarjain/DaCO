#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/sidmontu/Xilinx_Projects/daco_wrapper/wrapper/solution1/.autopilot/db/a.g.bc ${1+"$@"}
