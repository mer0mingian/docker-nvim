FROM alpine:latest
MAINTAINER soywod <clement.douin@gmail.com>

WORKDIR /root/workdir

ENV TERM xterm-256color
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8 

RUN \
  apk add --update --no-cache \
    build-base \
    neovim \
    python3 \
    python3-dev; \
  pip3 install neovim; \
  apk del build-base python3-dev

COPY entrypoint.sh /tmp/entrypoint
COPY generated/init.vim /root/.config/nvim/init.vim
COPY generated/autoload /root/.config/nvim/autoload
COPY generated/bundle /root/.config/nvim/bundle

RUN nvim +UpdateRemotePlugins +qa

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint"]
