#!/bin/bash

TARGET=${1:-.}
TARGET_PATH=$(realpath $TARGET)
TARGET_NAME=$(basename $TARGET_PATH)
VIM_PATH=$(realpath ~/.vim)
VIMRC_PATH=$(realpath ~/.vimrc)

docker run \
    --rm \
    -it \
    -v "$TARGET_PATH:/root/workdir/$TARGET_NAME" \
    -e "TARGET=$TARGET_NAME" \
    soywod/vim 