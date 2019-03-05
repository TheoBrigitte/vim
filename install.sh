#!/usr/bin/env bash

set -eu

PATHOGEN_URL="https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

LIST=false
PLUGIN_ADD=""
PLUGIN_REMOVE=""
SKIP=false
UPDATE=false

main() {
	parse_arguments $@

	if [ -n "${PLUGIN_REMOVE}" ]; then
		plugin_remove "${PLUGIN_REMOVE}"
	elif [ -n "${PLUGIN_ADD}" ]; then
		plugin_add "${PLUGIN_ADD}"
	elif ${UPDATE}; then
		plugin_update
	elif ${LIST}; then
		plugin_list
	else
		vimrc_backup
	fi
}

_printf() {
	fmt="%-30s%-12s%-12s\n"
	printf ${fmt} "$@"
}

usage() {
	printf "Usage: %s [ACTION]

vim configuration manager

	<no action>	Install vim configuration
	-a <url>	Install (or update) a plugin
	-h		Print this help
	-l		List installed plugins
	-r <url>	Remove a plugin
	-u		Update all plugins
	-s		Skip vim-go binaries installation

<url>	github user/repo format
" $(basename $0)
}

parse_arguments() {
	while getopts "a:hlr:su" name; do
		case $name in
			a)	PLUGIN_ADD=${OPTARG};;
			l)	LIST=true;;
			r)	PLUGIN_REMOVE=${OPTARG};;
			s)	SKIP=true;;
			u)	UPDATE=true;;
			h|?)	usage
				exit 0;;
		esac
	done
}

vimrc_backup() {
	if [ -e ~/.vimrc ]; then
		_printf "> backup vimrc"
		(
			set -e
			date="$(date +%F_%H-%M-%S)"
			set -x
			mv -b ~/.vimrc ~/.vimrc_${date}
		)
	fi
	_printf "> vim configuration installed"
}

plugin_add() {
	local name=$(url_clean "${1}")
	_printf "> add plugin: ${name}"

	add_plugin "${name}"

	echo "${name}" >> "${SCRIPT_DIR}/plugins"
	update_plugins_file
	vim +Helptags +qall
}

add_plugin() {
	local url=$(url_format "${1}")
	local path=$(basename ${1})

	if [ -d "${SCRIPT_DIR}/bundle/${path}" ]; then
		rm -rf "${SCRIPT_DIR}/bundle/${path}"
	fi
	(
		set -ex
		git clone --quiet --depth=1 --recurse-submodules "${url}" "${SCRIPT_DIR}/bundle/${path}" 1> /dev/null
	)
	rm -rf "${SCRIPT_DIR}/bundle/${path}/.git"
}

plugin_list() {
	while read -r name; do
		local path=$(basename ${name})
		local state=""
		if [ -d "${SCRIPT_DIR}/bundle/${path}" ]; then
			state="[installed]"
		else
			state="[missing]"
		fi
		printf "%-35s  %15s\n" "${name}" "${state}"
	done < "${SCRIPT_DIR}/plugins"
}

plugin_remove() {
	local name=$(url_clean ${1})
	local path=$(basename ${1})
	_printf "> remove plugin: ${name}"
	sed -i "\%${1}%d" "${SCRIPT_DIR}/plugins"

	(
		set -ex
		rm -r "${SCRIPT_DIR}/bundle/${path}"
	)
}

plugin_update() {
	update_plugins
	update_pathogen
	if ! ${SKIP}; then
		update_extra
	fi
	update_plugins_file
}

update_plugins() {
	_printf "> update plugins"
	while read -r name; do
		printf "  update ${name}\n"
		add_plugin "${name}" &>/dev/null &
	done < "${SCRIPT_DIR}/plugins"
	wait
	vim +Helptags +qall
}

update_pathogen() {
	_printf "> update pathogen"
	(
		set -ex
		curl -LSso \
			"${SCRIPT_DIR}/autoload/pathogen.vim" \
			"${PATHOGEN_URL}"
	)
	vim +Helptags +qall
}

update_extra() {
	_printf "> update extra commands"
	"${SCRIPT_DIR}/update.sh"
}

update_plugins_file() {
	_printf "> update plugin file"
	sed -i -E 's#(\w+://)?github.com/?##g' "${SCRIPT_DIR}/plugins"
	sort -uo "${SCRIPT_DIR}/plugins" "${SCRIPT_DIR}/plugins"
}

url_clean() {
	printf "${1}" | sed -E 's#(\w+://)?github.com/?##g'
}

url_format() {
	local name=$(url_clean "${1}")
	printf "https://github.com/%s" "${name}"
}

main $@
