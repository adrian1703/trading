#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  cat <<EOF
Usage: $0 [options]

Common operations for meta.bash:

  -u, --update      Push submodules, pull all, then push all
  -h, --help        Show this message

Examples:
  $0 -u
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -u|--update)
      # Common update operation
      "$SCRIPT_DIR/meta.bash" git submodule foreach 'git push' &&
      "$SCRIPT_DIR/meta.bash" git pull &&
      "$SCRIPT_DIR/meta.bash" git push
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      usage
      exit 1
      ;;
  esac
done