FROM alpine:latest
MAINTAINER soywod <clement.douin@gmail.com>

WORKDIR /root/workdir

ENV TERM xterm-256color
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8 

RUN \
  apk add --update --no-cache git python3 && \
  apk add --update --no-cache --virtual tmp-deps \
    build-base \
    make \
    ncurses-dev \
    python3-dev \
    curl && \
  git clone https://github.com/vim/vim /tmp/vim && \
  cd /tmp/vim && \
  ./configure \
    --enable-python3interp \
    --prefix /usr/local && \
  make install && \
  make clean && \
  apk del tmp-deps && \
  rm -rf /tmp/vim

COPY entrypoint.sh /tmp/entrypoint
COPY generated/.vimrc /root/.vimrc
COPY generated/autoload /root/.vim/autoload
COPY generated/bundle /root/.vim/bundle

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint"]
