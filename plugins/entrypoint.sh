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

echo "Downloading pathogen ..."
curl \
    --create-dirs \
    -LSso /vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim

echo "Downloading plugins"
for plugin in ${plugins[@]}; do
    echo " - ${plugin} ..."
    git clone https://github.com/${plugin} & > /dev/null
done

wait

echo "Done !"
