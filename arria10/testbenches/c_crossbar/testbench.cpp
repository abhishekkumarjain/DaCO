#include "Vtp_driver.h"
#include "verilated.h"
#include <iostream>

using namespace std;

int main(int argc, char **argv, char **env) {
	Verilated::commandArgs(argc, argv);
	Vtp_driver* top = new Vtp_driver;
	// TODO: add initialization stuff for generics and add a clock loop
	int time=0;
	bool clk=0;
	top->ce = 1;
	top->rst = 1;
	top->clk = 0;
	while (!Verilated::gotFinish() && !(top->done==1)) { 
		top->rst = (time<2);
		top->clk = clk;
		top->eval(); 
		clk=!clk;
		time++;
	}
//	cout << "// Verilator simulation finished at time=" << time << endl;
	delete top;
	exit(0);
}
