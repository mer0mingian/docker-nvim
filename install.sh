#!/bin/bash

PROCESS_START=$(date +%s)
VIMRC_PATH=$(realpath ~/.vimrc)
ALL=0

while [[ $# -gt 0 ]]; do
    param="$1"

    case $param in
        -v|--vimrc)
        VIMRC_PATH=$(realpath "$2")
        shift
        ;;

        -a|--all)
        ALL=1
        ;;

        *)
        ;;
    esac
    shift
done

if [ $ALL -eq 1 ]; then
    sudo rm -rf vim/generated

    docker build \
        -t soywod/vim-plugins \
        plugins

    docker run \
        --rm \
        -v "$(pwd)/vim/generated/bundle:/vim/bundle" \
        -v "$(pwd)/vim/generated/autoload:/vim/autoload" \
        soywod/vim-plugins

    sudo chown -R $(whoami):$(whoami) vim/generated
fi

if [ -f "$VIMRC_PATH" ]; then
    cp "$VIMRC_PATH" vim/generated/.vimrc
else
    echo "execute pathogen#infect()" > ~/.vimrc
    cp ~/.vimrc vim/generated/.vimrc
fi

docker build -t soywod/vim vim

PROCESS_TIME=$(($(date +%s) - ${PROCESS_START}))

echo
echo "Done in ${PROCESS_TIME}s"
