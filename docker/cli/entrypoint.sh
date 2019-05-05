#!/bin/sh -l

echo "docker cli entrypoint"
echo "$*"
sh -c "docker $*"