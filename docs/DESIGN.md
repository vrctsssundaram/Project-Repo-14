# Technical design

COLLECT holds the current repeated 32-bit value and an eight-bit count. On a different value or count saturation it enters EMIT without accepting the triggering sample, preserving that sample until the pending run is drained. Accepting a final input sample also flushes the run and marks it as packet-final. The output run remains stable while the consumer is stalled.

## Integration profile

Repeated 32-bit values form runs with counts of 1–255. Frame-final flags propagate with the last emitted run.
