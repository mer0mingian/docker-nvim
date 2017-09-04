FROM alpine:latest
MAINTAINER soywod <clement.douin@gmail.com>

ENV TERM xterm-256color

WORKDIR /root/workdir

COPY install /tmp/install

RUN /tmp/install/packages.sh

COPY plugins /tmp/plugins

RUN /tmp/install/plugins.sh

COPY entrypoint.sh /tmp/entrypoint.sh
COPY init.vim /root/.config/nvim/init.vim

RUN \
  /tmp/install/nvim-config.sh; \
  /tmp/install/clear.sh

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint.sh"]

