
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
  echo "[ERROR] This script is not meant to be executed directly!"
  echo "Use this script only by sourcing it."
  exit 1
fi

if [[ $DEBUG ]]; then
  set -e
fi

function log
{
  echo "$1" >&2
}

function info
{
  log "[INFO] ${1}"
}

function usage
{
  log "Usage: git review <pr_number>"
  exit 1
}

function error
{
  log "[ERROR] ${1}"
  exit 1
}


