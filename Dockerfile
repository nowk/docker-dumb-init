FROM debian:jessie
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

# install dependencies
RUN apt-get update && apt-get install -y \
	wget \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install dumb-init
RUN mkdir -p /opt/dumb-init/bin \
	&& wget -O /opt/dumb-init/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
	&& chmod +x /opt/dumb-init/bin//dumb-init

