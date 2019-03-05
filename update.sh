#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# Paste plugins update commands below
#
# vim commands like :DoSometing can be written as vim +DoSomething +qall

set -x

# update vim-go required binaries
vim +GoUpdateBinaries +qall

# update youcompletme dependencies
python3 bundle/youcompleteme/install.py \
	--go-completer \
	--ts-completer
