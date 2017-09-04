#!/bin/bash

IMAGE_NAME="soywod/nvim"

while [ $# -gt 0 ]; do
  param="$1"

  case $param in
    -n|--image-name)
    IMAGE_NAME="$2"
    shift
    ;;

    *)
    TARGET="$param"
    ;;
  esac
  shift
done

TARGET=${TARGET:=.}
TARGET_PATH=$(realpath $TARGET)
TARGET_NAME=$(basename $TARGET_PATH)

docker run \
  --rm \
  -it \
  -v "$TARGET_PATH:/root/workdir/$TARGET_NAME" \
  "$IMAGE_NAME"

