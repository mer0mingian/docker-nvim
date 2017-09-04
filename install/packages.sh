#!/bin/sh

PATHOGEN_FILE="/root/.config/nvim/autoload/pathogen.vim"
PATHOGEN_URL="https://tpo.pe/pathogen.vim"

apk add --update --no-cache \
  git \
  vimdiff \
  the_silver_searcher \
  python3 \
  neovim \
  neovim-doc

apk add --update --no-cache --virtual build-deps \
  build-base \
  curl \
  python3-dev

pip3 install neovim

curl \
  --create-dirs \
  -LSso $PATHOGEN_FILE \
  $PATHOGEN_URL 

apk del build-deps

