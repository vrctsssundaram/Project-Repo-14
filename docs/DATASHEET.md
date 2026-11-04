# Interface summary

| Field | Definition |
|---|---|
| Input | 32-bit sample, valid/ready and packet-last |
| Output | 32-bit run value, eight-bit count, packet-last and valid/ready |
| Run limit | 255 equal samples; longer runs are emitted as multiple records |
| Status | Accepted input sample count and emitted run count |

## Assumptions and limits

This codec compresses repeated samples only; it does not guarantee reduced volume for variable data. No timestamp generation, dictionary coding, trace RAM, decompression engine, or AXI protocol adapter is included.
