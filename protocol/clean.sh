#!/bin/sh
rm -rf lib/src/generated
mkdir lib/src/generated
protoc --dart_out=grpc:lib/src/generated pb/crud.proto
