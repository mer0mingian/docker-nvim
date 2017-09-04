#!/bin/sh

PLUGINS_FILE="/tmp/plugins"

mkdir -p /root/.config/nvim/bundle
cd /root/.config/nvim/bundle

while IFS= read -r plugin; do
  if [ -z $plugin ]; then
    continue
  fi

  git clone "https://github.com/$plugin" &
done < $PLUGINS_FILE

wait

