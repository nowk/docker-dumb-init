# docker-dumb-init

Fixing `PID 1` signals with [dumb-init](https://github.com/Yelp/dumb-init) via `--volumes-from` for composeability.


## Install

    make
    make dumb-init-shared-volume


## Usage

This uses [nowk/docker.sh](https://github.com/nowk/docker.sh) to build a gulp wrapper that executes gulp via Docker.

    # get the PATH and preppend our dumb-init
    path=$(echo "$(node -- --rm --entrypoint env | grep ^PATH=)" | sed "s#PATH=##")
    path="/opt/dumb-init/bin:$path"

    args=(./node_modules/.bin/gulp "$@" -- \
      --rm -t -i \
      --volumes-from=dumb-initv1.2.0 \
      -e="PATH=$path" \
      -u $(id -u $(whoami)) --entrypoint dumb-init)

    # the path here is an assumed submodule path to docker-nodejs
    $(dirname $0)/../.lib/docker-nodejs/bin/node ${args[@]}

