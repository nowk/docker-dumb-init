# docker-dumb-init

Fixing `PID 1` signals with [dumb-init](https://github.com/Yelp/dumb-init) via `--volumes-from` for composeability.


## Install

    make
    make dumb-init-volume


## Usage

Usage uses `gulp` which generally has a PID issue and does not get exit signals properly.

    docker run --rm -it \
      -v=volume/bin/dumb-init:/usr/local/bin/dumb-init \
      --entrypoint=dumb-init \
      -u=$(id -u $(whoami)) \
      node:7.1.0 ./node_modules/.bin/gulp "%@"

