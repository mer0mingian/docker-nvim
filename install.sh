#!/bin/bash

PROCESS_START=$(date +%s)
CONFIG_PATH=$(realpath ~/.config/nvim/init.vim)
SKIP_PLUGINS=0

while [[ $# -gt 0 ]]; do
    param="$1"

    case $param in
        -c|--config)
        CONFIG_PATH=$(realpath "$2")
        shift
        ;;

        -s|--skip-plugins)
        SKIP_PLUGINS=1
        ;;

        *)
        ;;
    esac
    shift
done

if [ $SKIP_PLUGINS -eq 0 ]; then
    sudo rm -rf nvim/generated

    docker build \
        -t soywod/nvim-plugins \
        plugins

    docker run \
        --rm \
        -v "$(pwd)/nvim/generated/bundle:/nvim/bundle" \
        -v "$(pwd)/nvim/generated/autoload:/nvim/autoload" \
        soywod/nvim-plugins

    sudo chown -R $(whoami):$(whoami) nvim/generated
fi

if [ -f "$CONFIG_PATH" ]; then
    cp "$CONFIG_PATH" nvim/generated/init.vim
else
    echo "execute pathogen#infect()" > ~/init.vim
    cp ~/.vimrc vim/generated/init.vim
fi

docker build -t soywod/nvim nvim

PROCESS_TIME=$(($(date +%s) - ${PROCESS_START}))

echo
echo "Done in ${PROCESS_TIME}s"
