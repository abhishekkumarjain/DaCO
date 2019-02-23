CC := iverilog
CFLAGS := -I./include

all : pe

pe : src/pe.v
	@mkdir -p bin
	@$(CC) $(CFLAGS) -o./bin/$@ src/blk_mem_gen_0.v src/node_memory.v src/edge_memory.v src/pe.v

node_mem_tb :
	@mkdir -p bin
	@$(CC) $(CFLAGS) -o./bin/$@ src/blk_mem_gen_0.v src/node_memory.v testbenches/node_mem_tb.v

clean :
	@rm -rf bin

.PHONE : clean

