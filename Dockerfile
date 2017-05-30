FROM alpine:latest

MAINTAINER soywod <clement.douin@gmail.com>

RUN apk add --update --virtual build-deps \
  build-base \
  make \
  ncurses-dev \
  git

# Build vim from sources
RUN cd /tmp \
  && git clone https://github.com/vim/vim

RUN cd /tmp/vim \
  && ./configure \
  --prefix /usr \

RUN cd /tmp/vim && make install
RUN apk del build-deps

RUN apk add \
  libice \
  libsm \
  libx11 \
  libxt \
  ncurses

# Cleanup
RUN rm -rf \
  /var/cache/* \
  /var/log/* \
  /var/tmp/* \
  && mkdir /var/cache/apk

RUN mkdir /tmp/workdir

COPY entrypoint /tmp/entrypoint

ENTRYPOINT ["sh", "/tmp/entrypoint"]

