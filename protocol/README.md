## Pantry Protocol  
This directory contains the shared protocol definition and gRPC library used by the client and server.

### Protobuf  
`./pb/crud.proto` is the protocol buffers definition. It provides definitions for all message types and services that comprise the API.

### Code generation  
`./clean.sh` will perform a clean build and generation of the protocol definition file and export Dart code into `./lib/src/generated/pb/`. The library (`./lib/protocol.dart`) only exports the gRPC version of the generated code.
