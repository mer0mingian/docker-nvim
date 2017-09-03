# Docker-nvim

Neovim in a docker container.

## Installation

```bash
./install.sh [params]
```

Params :
- `-c | --config <path>`: Path to your `init.vim` file. Default: `~/.config/nvim/init.vim`
- `-n | --image-name <name>`: Docker image name. Default: `soywod/nvim`

## Start

```bash
./nvim.sh [file|folder] [params]
```

Params :
- `-n | --image-name <name>`: Docker image name. Default: `soywod/nvim`

## Plugins

Edit the `Dockerfile` and ajust the `plugins` section.
Any update will require a `./install.sh`.

## Tips

- To be able to start nvim via the command `nvim`, an alias is the best:

```bash
alias nvim='/path/to/nvim.sh -n <your-image-name>'
```

