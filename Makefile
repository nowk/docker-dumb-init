NAME=dumb-init
VERSION=1.2.0


default: build

build:
	docker build --rm -t ${NAME}:${VERSION} .


.PHONY: dumm-init-shared-volume

# Because we cannot plainly overlay the FS the volume, we need to add the
# shared-volume to PATH
#
#	# get the full PATH env from the docker in question, this uses a docker.sh'd
#	# node, can be other, eg. ruby, go, etc...
#	path=$(echo "$(node -- --entrypoint env | grep ^PATH=)" | sed "s#PATH=##")
#	path="/opt/dumb-init/bin:$path"
#
#   Then set the path via `-e`
#
#	-e="PATH=${path}"
#
dumb-init-shared-volume:
	docker run -v /opt/dumb-init --entrypoint /bin/bash --name ${NAME}v${VERSION} ${NAME}:${VERSION} -c "echo"

