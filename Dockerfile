FROM alpine:latest
MAINTAINER soywod <clement.douin@gmail.com>

ENV TERM xterm-256color
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8 

RUN \
  apk add --update --no-cache \
    git \
    the_silver_searcher \
    python3 \
    neovim \
    neovim-doc; \
  apk add --update --no-cache --virtual tmp-deps \
    build-base \
    curl \
    python3-dev; \
    pip3 install neovim; \
    curl \
      --create-dirs \
      -LSso /root/.config/nvim/autoload/pathogen.vim \
      https://tpo.pe/pathogen.vim; \
  apk del tmp-deps

WORKDIR /root/.config/nvim/bundle

COPY plugins /tmp/plugins

RUN \
  while IFS= read -r plugin; do \
    if [[ -z $plugin ]]; then continue; fi; \
    git clone "https://github.com/$plugin" & \
  done < /tmp/plugins; \
  wait

WORKDIR /root/workdir

COPY entrypoint.sh /tmp/entrypoint
COPY init.vim /root/.config/nvim/init.vim

RUN nvim +UpdateRemotePlugins +qa

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint"]

