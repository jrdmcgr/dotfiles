#!/bin/sh

set -e

if ! command -v /opt/homebrew/bin/stow >/dev/null 2>&1; then
    echo "Error: stow not found. Install with: brew install stow"
    exit 1
fi

/opt/homebrew/bin/stow --verbose --delete --target="$HOME" src

