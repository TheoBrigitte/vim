#!/bin/bash
#
# Author: Théo Brigitte
# Date: 2025-10-07

# Usage: clean-undo.sh [options] [--] [args...]
# Clean up old undo files older than 30 days from
# the undodir specified in nvim config.
#
# Options:
#   -w                    Write changes (delete files)
#
# Examples:
#   clean-undo.sh
#   clean-undo.sh -w

set -eu

expiry_days=30

# Read undodir from nvim config
#path="$(nvim -e +"set undodir?" -scq |

# Extract the path from neovim configuration
path="$(nvim -e +"set undodir?" -scq |
        # Extract the value after 'undodir='
        grep -oP '(?<=undodir=).+' |
        # Remove duplicate slashes
        sed -E 's#/{2,}#/#')"

# Safely expand ~ to home directory
path="${path/#\~/$HOME}"
path=~/.vim/undo

if [[ "${1:-}" == "-w" ]]; then
  find "$path" -mtime +$expiry_days -type f -delete
else
  find "$path" -mtime +$expiry_days -type f
  echo
  echo "[dry-run] run with -w to delete listed files"
fi
