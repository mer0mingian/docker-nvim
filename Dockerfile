FROM alpine:latest
MAINTAINER soywod <clement.douin@gmail.com>

ENV TERM xterm-256color
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8 

WORKDIR /root/.vim/bundle

# Install packages
RUN apk add --update curl git vim

# Install pathogen (vim plugin manager)
RUN curl -LSso /root/.vim/autoload/pathogen.vim --create-dirs \
  https://tpo.pe/pathogen.vim

# Install vim plugins (async)
RUN \
  git clone https://github.com/tpope/vim-surround & \
  git clone https://github.com/tpope/vim-commentary & \
  git clone https://github.com/editorconfig/editorconfig-vim & \
  git clone https://github.com/pangloss/vim-javascript & \
  git clone https://github.com/rakr/vim-one & \
  git clone https://github.com/flowtype/vim-flow & \
  git clone https://github.com/ctrlpvim/ctrlp.vim.git & \
  wait

# Clean up
RUN \
  apk del curl git && \
  rm -rf /var/cache/* && \
  rm -rf /var/log/* && \
  rm -rf /var/tmp/*

WORKDIR /root/workdir

COPY entrypoint.sh /tmp/entrypoint
COPY .vimrc /root/.vimrc

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint"]
