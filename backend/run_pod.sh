#!/bin/sh
podman run -d -it --rm -p 8080:8080 --name theserver hello-dart
