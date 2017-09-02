#!/bin/sh

resize > /dev/null

if [ -f "$TARGET" ]; then
    vim $TARGET
elif [ -d "$TARGET" ]; then
    cd $TARGET
    vim
else
    vim
fi
