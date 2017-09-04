#!/bin/sh

INIT_FILE="/root/.config/nvim/init.vim"

# Try to remove existing plugins manager
sed -i '/call [a-z]*#begin\(.*\)/,/call [a-z]*#end\(\)/d' $INIT_FILE
sed -i '/execute pathogen#infect\(\)/d' $INIT_FILE

# Add pathogen.vim
sed -i '1s/^/execute pathogen#infect()\n/' $INIT_FILE

nvim +UpdateRemotePlugins +qa

