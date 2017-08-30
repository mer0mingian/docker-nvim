FROM alpine:latest

MAINTAINER soywod <clement.douin@gmail.com>

RUN apk add --update --virtual build-deps \
  build-base \
  make \
  ncurses-dev \
  curl

RUN apk add \
  libice \
  libsm \
  libx11 \
  libxt \
  git \
  ncurses

# Build vim from sources
RUN cd /tmp \
  && git clone https://github.com/vim/vim

RUN cd /tmp/vim \
  && ./configure \
  --prefix /usr \

RUN cd /tmp/vim && make install

RUN mkdir /tmp/workdir

COPY vimrc /root/.vimrc

RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN vim +PlugInstall +qa

# Cleanup
RUN apk del build-deps
RUN rm -rf \
  /var/cache/* \
  /var/log/* \
  /var/tmp/* \
  && mkdir /var/cache/apk

CMD vim
