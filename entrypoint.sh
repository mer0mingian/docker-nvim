#!/bin/sh

TARGET=$(ls | head -n 1)

resize > /dev/null

if [ -f "$TARGET" ]; then
    nvim $TARGET
elif [ -d "$TARGET" ]; then
    cd $TARGET
    nvim
else
    nvim
fi

