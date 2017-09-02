#!/bin/bash

VIMRC_PATH=${1:-"$(realpath ~/.vimrc)"}

docker build \
    -t soywod/vim-plugins \
    plugins

docker run \
    --rm \
    -v "$(pwd)/vim/generated/bundle:/vim/bundle" \
    -v "$(pwd)/vim/generated/autoload:/vim/autoload" \
    soywod/vim-plugins

if [ -f "$VIMRC_PATH" ]; then
    cp "$VIMRC_PATH" vim/generated/.vimrc
else
    echo "execute pathogen#infect()" > ~/.vimrc
    cp ~/.vimrc vim/generated/.vimrc
fi

docker build -t soywod/vim vim
