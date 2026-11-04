IVERILOG ?= iverilog
VVP ?= vvp
YOSYS ?= yosys
.PHONY: test synth clean
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_trace_rle32 -o build/sim rtl/trace_rle32.sv tb/tb_trace_rle32.sv
	$(VVP) build/sim
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/trace_rle32.sv; hierarchy -check -top trace_rle32; synth -top trace_rle32; stat'
clean:
	rm -f build/sim
