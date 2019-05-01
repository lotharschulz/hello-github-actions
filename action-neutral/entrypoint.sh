#!/bin/bash

# inspired by https://github.com/actions/bin/blob/master/sh/entrypoint.sh @ 2019 04 24

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'
NEUTRALCODE=78

for cmd in "$@"; do
    echo "Running '$cmd'..."
    if sh -c "$cmd"; then
        # no op
        echo "Successfully ran '$cmd'"
    else
        exit_code=$?
        echo "Failure running '$cmd', exited with $exit_code. Action will return $NEUTRALCODE 'neutral'."
        exit $NEUTRALCODE
    fi
done