# Dataflow Coprocessor Overlay (DaCO)

DaCO is a token dataflow overlay accelerator that does comptutation based on
the explicit dataflow graph execution model (See [1]).

[1] *Jack B. Dennis and David P. Misunas. 1974. A preliminary architecture for
a basic data-flow processor. In Proceedings of the 2nd annual symposium on
Computer architecture (ISCA '75). ACM, New York, NY, USA, 126-132.
DOI=http://dx.doi.org/10.1145/642089.642111*

## FPGA Targets

There is an implementation designed to target Arria 10 FPGA boards, which
allows us to exploit the native floating-point DSP cores in the FPGA fabric.
However, this design lacks interfacing work, as it was used largely for
research. Open-sourcing this body of work is currently underway, but you would
have to write your own interface to get data in and out of the FPGA as of now.

A lighter implementation on the PYNQ board is also under development, for
which, the goal is to provide a complete solution with the overlay bitstream
and a Python programming API. 

## Migen/FuseSoC

If possible, I will try to release it as a core in Migen/FuseSoc as a reuseable
IP.

## Packet-Switching Router

DaCO uses the Hoplite[2] suite of routers to connect clusters of
soft-processors. Unfortunately, Hoplite is currently not available on an
open-source license. At the moment, DaCO would not work as an "out-of-the-box"
solution, until you provide your own router with the required interface. This
might require some hacking around with the source code, so if you have any
questions/issues, feel free to get in touch with the developers. I will try to
add a short guide on how to integrate your own router.

[2] http://fpga.org/hoplite/

## Developers/Authors

[Siddhartha](https://sidmontu.github.io)

## License

This work is released under the MIT License (See LICENSE.txt).
