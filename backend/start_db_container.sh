#!/bin/sh
# podman run -d \
#   --rm \
#   --name some-mysql-rootless \
#   -e MYSQL_ROOT_PASSWORD=password \
#   -e MYSQL_DATABASE=database \
#   -p 33060:3306 \
#   -v ./mysql_container:/var/lib/mysql:Z \
#   docker.io/library/mysql:latest

podman run -d \
  --rm \
  --name test-db \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=password \
  -v ./db:/var/lib/postgresql \
  docker.io/library/postgres:latest
