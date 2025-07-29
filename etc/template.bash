#!/usr/bin/env bash
# vim: filetype=bash noexpandtab tabstop=2 shiftwidth=2

set -euo pipefail

trap 'cleanup' EXIT
function cleanup
{
  echo "Bye!"
}

function usage
{
  echo "Usage: $0 [args]" >&2
  exit 1
}

function main
{
  # Set IFS only if needed, and locally
  # IFS=' '

  # Your script logic here
  echo "Hello, world!"
}

main "$@"
