FROM alpine:latest

MAINTAINER soywod <clement.douin@gmail.com>
WORKDIR /root/workdir

RUN \
  apk add --update vim git && \
  rm -rf /var/cache/* /var/log/* /var/tmp/* && \
  mkdir /var/cache/apk

ADD entrypoint.sh /tmp/entrypoint

ENTRYPOINT ["/bin/sh", "/tmp/entrypoint"]
