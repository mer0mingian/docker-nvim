FROM alpine:latest
MAINTAINER soywod <clement.douin@gmail.com>

RUN apk add --update --no-cache git curl bash

WORKDIR /vim

COPY entrypoint.sh /tmp/entrypoint

ENTRYPOINT ["/bin/bash", "/tmp/entrypoint"]