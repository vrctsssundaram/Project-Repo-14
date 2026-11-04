# Verification record

Date: 05 November 2026
Source revision tested: `c74a34da02c44c1b3055c8c4e43bd49354039ef3`
Hosted verification: https://github.com/vrctsssundaram/Project-Repo-14/actions/runs/41900981980

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (Icarus Verilog, `-g2012 -Wall`) |
| Directed self-checking simulation | **PASS** (exit code 0) |
| Directed checks | three-value run encoding, run lengths and packet-last, input stall, output held under backpressure, lossless sample counts |
| Generic Yosys synthesis | **PASS**; 398 technology-independent cells |
| FPGA/ASIC technology-specific utilization | Not measured |
| Static timing, maximum clock, power | Not measured |
| Physical hardware throughput | Not measured |

The synthesis count is taken from the top-level `stat` section of the hosted generic Yosys run, not a device-mapped area estimate. The directed testbench is bounded and does not constitute exhaustive or formal verification. No artificial waveform, timing, area, or power result is presented as a measurement.
