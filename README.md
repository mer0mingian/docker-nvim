# Docker-nvim

Neovim in a docker container.

## Installation

```bash
./build.sh [params]
```

Params :
- `-i | --init-file <path>`: Path to your `init.vim` file
- `-p | --plugins-file <path>`: Path to your `plugins` file
- `-n | --image-name <name>`: Docker image name. Default: `soywod/nvim`

## Start

### From helper

```bash
./nvim.sh target [params]
```

Params :
- `-n | --image-name <name>`: Docker image name. Default: `soywod/nvim`

### From docker command

```bash
docker run \
  --rm \
  -it \
  -v "<path/to/target>:/root/workdir/<target-name>" \
  "<image-name>"
```

## Plugins

To add plugins, create a file named `plugins`, and give its path via the `-p` params to `install.sh`.
Then add on each line the plugin name (the GitHub one).

Example of a valid `plugins` file :

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

Empty lines will be ignored.

## Tips

- To be able to start nvim via the command `nvim`, an alias is the best:

```bash
alias nvim='/path/to/nvim.sh -i <init.vim> -p <plugins> -n <your-image-name>'
```

