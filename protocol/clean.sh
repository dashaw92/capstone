#!/bin/sh

# For whatever reason, protoc refused to overwrite existing files. Bypass this requirement by deleting the base directory.
rm -rf lib/src/generated
# ... and then it's also weirdly incapable of *creating* the output directory... So create the directory for it...
mkdir lib/src/generated
# *Finally* we can actually invoke the compiler and generate the code.
protoc --dart_out=grpc:lib/src/generated pb/crud.proto
