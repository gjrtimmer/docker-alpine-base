FROM alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG DOCKER_IMAGE
ARG ALPINE_VERSION

LABEL \
    maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name=alpine-base \
    org.label-schema.vendor=timmertech.nl \
    org.label-schema.url="https://gitlab.timmertech.nl/docker/alpine-base" \
    org.label-schema.vcs-url="https://gitlab.timmertech.nl/docker/alpine-base.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.docker.image="${DOCKER_IMAGE}" \
    org.label-schema.alpine-version="${ALPINE_VERSION}" \
    nl.timmertech.license=MIT

ENV S6_OVERLAY_VERSION=v2.2.0.1 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    ALPINE_VERSION=${ALPINE_VERSION}

RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache curl bash git tar gzip bzip2 file ca-certificates && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar -xzf - -C /

ENTRYPOINT ["/init"]
