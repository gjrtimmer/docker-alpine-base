ARG DOCKER_PROXY
ARG ALPINE_VERSION
FROM ${DOCKER_PROXY}/linuxserver/baseimage-alpine:${ALPINE_VERSION}

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main'  >> /etc/apk/repositories && \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community'  >> /etc/apk/repositories && \
    apk add --no-cache --force-overwrite --update \
    curl \
    wget \
    bash \
    git \
    git-lfs \
    tar \
    gzip \
    bzip2 \
    file \
    shadow \
    findutils \
    openssl \
    ca-certificates && \
    update-ca-certificates

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    ALPINE_VERSION=${ALPINE_VERSION}

ARG BUILD_DATE
ARG CI_PROJECT_NAME
ARG CI_PROJECT_URL
ARG VCS_REF
ARG DOCKER_IMAGE
ARG ALPINE_VERSION

LABEL \
    maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="${CI_PROJECT_NAME}" \
    org.label-schema.url="${CI_PROJECT_URL}" \
    org.label-schema.vcs-url="${CI_PROJECT_URL}.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.docker.image="${DOCKER_IMAGE}" \
    org.label-schema.alpine-version="${ALPINE_VERSION}" \
    org.label-schema.license=MIT
