# TraceZip-RTL

Lossless streaming run-length encoder for 32-bit diagnostic trace samples.

## Features

- Equal consecutive samples compressed into `{data,count}` runs
- Eight-bit run count supports 1–255 samples
- Packet-end marker propagated to the final run
- Source and sink backpressure with 32-bit sample/run counters

## Verification

Run `make test` for the self-checking regression or `make synth` for a synthesis check. See `docs/` for the design, interface, procedure and recorded results.

**Architecture:** Streaming 32-bit run-length encoder with 8-bit repeat count and frame markers.

Project owner: Sundaram S S.
