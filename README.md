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

To add plugins, create a file named `.plugins` at the root folder.
Then add on each line the plugin name (the GitHub one).

Example of a valid `.plugins` file :

```text
tpope/vim-surround
tpope/vim-commentary
editorconfig/editorconfig-vim
pangloss/vim-javascript
rakr/vim-one
flowtype/vim-flow
Shougo/denite.nvim

...
```

## Tips

- To be able to start nvim via the command `nvim`, an alias is the best:

```bash
alias nvim='/path/to/nvim.sh -n <your-image-name>'
```

