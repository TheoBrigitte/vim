# Vim configuration

Here is my Vim configuration aimed at Golang development.

It uses [pathogen][1] as plugin manager.

Here is the list of [plugins](plugins) used.

### Install

Clone this repo and run the installer:

`git clone https://github.com/TheoBrigitte/vim ~/.vim && ~/.vim/install.sh`

Note: It will backup your current .vimrc file to ~/.vimrc_<date>

### Plugins management

Plugins are managed using the fairly small `install.sh` script.
It does so by downloading latest plugin snapshot, in order to avoid storing
unecessary git history.
Plugins are stored in the `bundle` directory.
The list of plugins is stored in the `plugins` file.
It also uses `update.sh` for extra commands to be run on plugin update.
Only plugin hosted on github are supported.

See `$ ./install.sh -h` for help.

#### Update all plugins

`$ ./install.sh -u`

Note: use `-s` to skip expensive additional update commands.

#### Add/Update a plugin

`$ ./install.sh -a scrooloose/nerdtree`

#### Remove a plugin

`$ ./install.sh -r scrooloose/nerdtree`

### List installed plugins

```
$ ./install.sh -l
scrooloose/nerdtree                      [installed]
```


[1]: https://github.com/tpope/vim-pathogen
