#include <iostream>
#include <string.h>
#include "Vtop_level.h"
#include "verilated.h"
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif


// Current simulation time (64-bit unsigned)
uint64_t main_time = 0;


int main(int argc, char* argv[]) {

  //////////////////////////////////////////////////////////////////////
  // initialize
  //////////////////////////////////////////////////////////////////////

  // initialize verilator
  Verilated::commandArgs(argc, argv);
  Vtop_level top;

  // to ensure repeatability of the generated random numbers
  srand(0);

  // waveform generation
  VerilatedVcdC* tfp = NULL;
#if VM_TRACE
  // If verilator was invoked with --trace
  Verilated::traceEverOn(true);
  VL_PRINTF("Enabling waves...\n");
  tfp = new VerilatedVcdC;
  assert(tfp);
  // Trace 99 levels of hierarchy
  top.trace(tfp, 99);
  tfp->spTrace()->set_time_resolution("1 ns");
  // Open the dump file
  tfp->open("../trace.vcd");
#endif

#define ADVANCE(ns) do {               \
                top.clk ^= 1;    \
		top.eval();                        \
		if (tfp) tfp->dump(main_time);     \
		main_time += ns;                   \
	} while(0)
  
  //////////////////////////////////////////////////////////////////////
  // write your test sequence here
  // remember to advance the time properly after each new input set
  //////////////////////////////////////////////////////////////////////

  top.clk = 0;
  top.rst = 0;
  top.bouncey = 0;
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  top.bouncey = 1;
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);

  for (int i = 0; i < 1000000 - 5; i++)
  {
      ADVANCE(10);
      ADVANCE(10);
  }

  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);


  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  top.bouncey = 0;

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  for (int i = 0; i < 1000000 - 5; i++)
  {
      ADVANCE(10);
      ADVANCE(10);
  }

  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);

  ADVANCE(10);
  ADVANCE(10);
  VL_PRINTF("clk=%d, rst=%d, bouncey=%d, clean=%d, count=0x%05x\n", top.clk, top.rst,
          top.bouncey, top.clean, top.count);



  //////////////////////////////////////////////////////////////////////
  // finalize
  //////////////////////////////////////////////////////////////////////

  // execute the final blocks (if any)
  top.final();

  // finalize the trace
#if VM_TRACE
  if (tfp) tfp->close();
  delete tfp;
#endif

  return 0;
}
