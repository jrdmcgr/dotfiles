#!/bin/bash
set -euo pipefail
if [ -z "$1" ]; then
  echo "Usage: mk-repo REPO_NAME"
  exit 1
fi
gh repo create "$1" \
  --private \
  --add-readme \
  --disable-wiki \
  --disable-issues \
  --clone

cd $1

