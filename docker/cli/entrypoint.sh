#!/bin/sh -l

echo "docker cli entrypoint master"
echo "$*"
sh -c "docker $*"