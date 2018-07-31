# Vim configuration

Here is my Vim configuration aimed at Golang development.

It uses [pathogen][1] as plugin manager.

Here is the list of [plugins](plugins) used.

### Install

Clone this repo and run the installer:

`git clone https://github.com/TheoBrigitte/vim ~/.vim && ~/.vim/install.sh`

Note: It will backup your current .vimrc file to ~/.vimrc_<date>

### Plugins

#### Update plugin

Delete and re-download all plugins with latest version.

`./install.sh -u`

#### Add a plugin

Only support vim plugin hosted on github.

`./install.sh -a https://github.com/scrooloose/nerdtree`

#### Remove a plugin

`./install.sh -r https://github.com/scrooloose/nerdtree`



[1]: https://github.com/tpope/vim-pathogen
