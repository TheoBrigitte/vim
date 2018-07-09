#!/usr/bin/env bash

set -eu

PATHOGEN_URL="https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

SKIP_VIMGO=false
RUN_UPDATE=false

main() {
	parse_arguments $@


	backup_vimrc
	update_plugins
	update_pathogen
	update_vimgo
	_printf "> vim configuration installed"
}

_printf() {
	fmt="%-30s%-12s%-12s\n"
	printf ${fmt} "$@"
}

usage() {
	printf "Usage: %s: [-u] [-q]\n
	-u	Run plugins update
	-s	Skip vim-go binaries installation\n" $0
}

parse_arguments() {
	while getopts "su" name; do
		case $name in
			s)	SKIP_VIMGO=true;;
			u)	RUN_UPDATE=true;;
			?)	usage
				exit 2;;
		esac
	done
}

backup_vimrc() {
	if [ -e ~/.vimrc ]; then
		_printf "> backup ~/.vimrc"
		mv -b ~/.vimrc ~/.vimrc_$(date +%F_%H-%M-%S)

	fi
}

update_plugins() {
	if ! ${RUN_UPDATE}; then return 0; fi

	_printf "> update plugins"
	while read -r file; do
		(
			local name=$(basename $file)
			mkdir -p "${SCRIPT_DIR}/bundle/${name}"
			curl -LSs \
				"$file/archive/master.tar.gz" | \
			tar xvz \
				--strip=1 \
				-C "${SCRIPT_DIR}/bundle/${name}"
		)
	done < "${SCRIPT_DIR}/plugins"
}

update_pathogen() {
	if ! ${RUN_UPDATE}; then return 0; fi

	_printf "> update pathogen"
	curl -LSso \
		"${SCRIPT_DIR}/autoload/pathogen.vim" \
		"${PATHOGEN_URL}"
	vim +Helptags +qall
}

update_vimgo() {
	if ! ${RUN_UPDATE}; then return 0; fi
	if ${SKIP_VIMGO}; then return 0; fi

	_printf "> update vim-go binaries"
	vim +GoUpdateBinaries +qall
}

main $@
