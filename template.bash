#!/usr/bin/env bash
set -euo pipefail

# Uncomment if your script uses temp files or traps
# trap 'cleanup' EXIT

usage() {
  echo "Usage: $0 [args]" >&2
  exit 1
}

main() {
  # Set IFS only if needed, and locally
  # IFS=' '

  # Your script logic here
  echo "Hello from main"
}

main "$@"
