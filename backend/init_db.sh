#!/bin/sh
psql -h localhost -U postgres -c "DROP DATABASE db;" -c "CREATE DATABASE db WITH ENCODING 'UTF-8';"
