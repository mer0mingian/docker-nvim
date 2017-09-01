#!/bin/bash

VIMRC_PATH=${1:-"$(realpath ~/.vimrc)"}

if [ $VIMRC_PATH == http* ]; then
    if ! curl; then
        echo "curl is missing"
        exit 1
    fi

    curl -fLo .vimrc "$VIMRC_PATH"
elif [ -f "$VIMRC_PATH" ]; then
    cp "$VIMRC_PATH" .
fi

docker build -t soywod/vim .
