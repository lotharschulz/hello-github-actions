#!/bin/sh -l

echo "docker cli entrypoint testbranchA"
echo "$*"
sh -c "docker $*"