# Interface summary

| Field | Definition |
|---|---|
| Input | 32-bit sample, valid/ready and packet-last |
| Output | 32-bit run value, eight-bit count, packet-last and valid/ready |
| Run limit | 255 equal samples; longer runs are emitted as multiple records |
| Status | Accepted input sample count and emitted run count |

## Integration profile

Repeated 32-bit values form runs with counts of 1–255. Frame-final flags propagate with the last emitted run.
