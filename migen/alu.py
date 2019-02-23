from migen import *
from migen.fhdl import verilog

class ALU(Module) :
    def __init__(self) :
        self.FPDSP_LATENCY = 1
        self.counter = Signal(4)

        self.sync += self.counter.eq(self.counter + 1)

def ALU_tb(dut) :
    for i in range(20) :
        print((yield dut.counter))
        yield

if __name__ == "__main__" :
    dut = ALU()
    run_simulation(dut, ALU_tb(dut), vcd_name = "alu_tb.vcd")

    top_module = ALU()
    print(verilog.convert(top_module))
