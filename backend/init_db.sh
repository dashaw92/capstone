#!/bin/sh
psql -h localhost -U postgres -c "CREATE DATABASE my_drift_database WITH ENCODING 'UTF8';"
