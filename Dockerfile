FROM gliderlabs/alpine:3.4
MAINTAINER Madhav Raj Maharjan <madhav.maharjan@gmail.com>

ARG VCS_REF
ARG MYSQL_VERSION
ARG DEBUG=false

LABEL description="Docker container with MySQL Client" os_version="Alpine 3.4" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/madharjan/docker-mysql-client"

ENV HOME /root
ENV ALPINE_VERSION 3.4
ENV MYSQL_VERSION ${MYSQL_VERSION}

RUN mkdir -p /build
COPY . /build

RUN chmod 755 /build/scripts/*.sh && /build/scripts/install.sh && /build/scripts/cleanup.sh

WORKDIR /root

ENTRYPOINT ["/docker-entrypoint.sh"]
