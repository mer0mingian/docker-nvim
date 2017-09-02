# Docker-vim

Vim in a docker container.

## Installation

```bash
./install.sh
```

Parameters :
- `-s | --skip-plugins`: Skip the plugins install process
- `-v | --vimrc <path>`: Path to your vimrc file. Default: ~/.vimrc

## Start

```bash
./vim.sh <file|folder>
```

## Plugins

Edit `plugins/entrypoint.sh` and ajust the variable `plugins`.
Each update needs a `./install.sh`.
