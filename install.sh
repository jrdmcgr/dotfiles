#!/bin/sh

set -e

/opt/homebrew/bin/stow --verbose --target="$HOME" src
