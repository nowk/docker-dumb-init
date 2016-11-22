NAME=dumb-init
VERSION=1.2.0


default: build

build:
	docker build --rm -t ${NAME}:${VERSION} .


.PHONY: dumm-init-volume


# dumb-init-volume
# creates a data volume that can be mounted via file,
#
#     -v volume/bin/dumb-init:/usr/local/bin/dumb-init
#
dumb-init-volume:
	docker create -v /usr/local/bin --name ${NAME}v${VERSION} ${NAME}:${VERSION}
	mkdir -p volume
	docker cp ${NAME}v${VERSION}:/usr/local/bin volume
	docker rm -v ${NAME}v${VERSION}

