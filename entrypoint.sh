#!/bin/sh -l

echo "Hello $1"
echo "INPUT_A: $INPUT_A"
time=$(date)
echo "::set-output name=time::$time"
