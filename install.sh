#!/bin/bash

PROCESS_START=$(date +%s)
CONFIG=$(realpath ~/.config/nvim/init.vim)
IMAGE_NAME="soywod/nvim"

while [[ $# -gt 0 ]]; do
  param="$1"

  case $param in
    -c|--config)
    CONFIG=$(realpath "$2")

    if [ ! -f "$CONFIG" ]; then
      echo "Config file '$CONFIG' not found"
      exit !
    fi

    shift
    ;;

    -n|--image-name)
    IMAGE_NAME="$2"
    shift
    ;;

    *)
    ;;
  esac
  shift
done

if [ ! -f "$CONFIG" ]; then
  mkdir -p ~/.config/nvim
  echo "execute pathogen#infect()" > "$CONFIG"
fi

cp "$CONFIG" init.vim

docker build -t "$IMAGE_NAME" .

PROCESS_TIME=$(($(date +%s) - ${PROCESS_START}))

echo
echo "Done in ${PROCESS_TIME}s"
