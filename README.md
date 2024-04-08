# Vim configuration

Here is my Vim configuration aimed at Golang development.

### Install

#### Requirements

* universal ctags: https://github.com/universal-ctags/ctags

#### Setup

First remove any existing `~/.vimrc` file.

1. Clone this repo `git clone https://github.com/TheoBrigitte/vim ~/.vim`
2. Run `vim -s install.vim`

### Plugins management

* Plugins are managed by [vim-plug][1] and stored under [bundle](bundle).
* Here is the list of used [plugins](config/01.plugin.vim).
* See [commands][2] in vim-plug documentation for further management.


[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/junegunn/vim-plug#commands
