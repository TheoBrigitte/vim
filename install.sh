#!/usr/bin/env bash

set -eu

PATHOGEN_URL="https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

SKIP_VIMGO=false
RUN_UPDATE=false
ADD_PLUGIN=""
REMOVE_PLUGIN=""

main() {
	parse_arguments $@

	if [ -n "${REMOVE_PLUGIN}" ]; then
		remove_plugin ${REMOVE_PLUGIN}
		exit 0
	fi

	if [ -n "${ADD_PLUGIN}" ]; then
		add_plugin ${ADD_PLUGIN}
		exit 0
	fi

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
	printf "Usage: %s: [-a] [-r] [-s] [-u]\n
	-a	Add plugin
	-r	Remove plugin
	-s	Skip vim-go binaries installation
	-u	Run plugins update\n" $0
}

parse_arguments() {
	while getopts "a:r:su" name; do
		case $name in
			a)	ADD_PLUGIN=${OPTARG};;
			r)	REMOVE_PLUGIN=${OPTARG};;
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

add_plugin() {
	local url="${1}"
	_printf "> add plugin: ${url}"

	_add_plugin "${url}"

	echo "${url}" >> "${SCRIPT_DIR}/plugins"
	sort -uo "${SCRIPT_DIR}/plugins" "${SCRIPT_DIR}/plugins"
}

_add_plugin() {
	local url="${1}"
	local name=$(basename ${1})

	if [ -d "${SCRIPT_DIR}/bundle/${name}" ]; then
		rm -rf "${SCRIPT_DIR}/bundle/${name}"
	fi
	git clone --depth=1 --recurse-submodules "${url}" "${SCRIPT_DIR}/bundle/${name}"
	rm -rf "${SCRIPT_DIR}/bundle/${name}/.git"
}


remove_plugin() {
	_printf "> remove plugin: ${1}"
	sed -i "\%${1}%d" "${SCRIPT_DIR}/plugins"

	local name=$(basename ${1})
	rm -r "${SCRIPT_DIR}/bundle/${name}"
}

update_plugins() {
	if ! ${RUN_UPDATE}; then return 0; fi

	_printf "> update plugins"
	while read -r url; do
		(
			_add_plugin "${url}"
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
