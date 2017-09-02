#!/bin/bash

plugins=(
    'tpope/vim-surround'
    'tpope/vim-commentary'
    'editorconfig/editorconfig-vim'
    'pangloss/vim-javascript'
    'rakr/vim-one'
    'flowtype/vim-flow'
    'Shougo/denite.nvim'
)

cd /vim/bundle

curl \
    --create-dirs \
    -LSso /vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim

for plugin in ${plugins[@]}; do
    git clone https://github.com/${plugin} &
done

wait
