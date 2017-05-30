#!/bin/bash

docker run --rm -it -v $(realpath $1):/tmp/workdir/$(basename $1) -e "TARGET=$(basename $1)" soywod/docker-vim

