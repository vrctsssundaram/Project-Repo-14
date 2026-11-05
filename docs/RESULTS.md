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

**Evidence:** Tool-reported Icarus Verilog regression and Yosys synthesis results for the source revision cited above.
