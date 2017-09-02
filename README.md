# Docker-nvim

Neovim in a docker container.

## Installation

```bash
./install.sh
```

Parameters :
- `-s | --skip-plugins`: Skip the plugins install process
- `-c | --config <path>`: Path to your `init.vim` file. Default: `~/.config/nvim/init.vim`

## Start

```bash
./nvim.sh <file|folder>
```

## Plugins

Edit `plugins/entrypoint.sh` and ajust the `plugins` variable.
Any update will require a `./install.sh`.
