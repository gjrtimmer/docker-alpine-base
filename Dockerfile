ARG DOCKER_PROXY
ARG ALPINE_VERSION
FROM ${DOCKER_PROXY}/linuxserver/baseimage-alpine:${ALPINE_VERSION}

RUN apk add --no-cache --force-overwrite --update \
    curl \
    wget \
    bash \
    coreutils \
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

ARG ALPINE_VERSION
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
    build_version="${BUILD_DATE}" \
    org.opencontainers.image.authors="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="${CI_PROJECT_NAME}" \
    org.opencontainers.image.url="${CI_PROJECT_URL}" \
    org.opencontainers.image.source="${CI_PROJECT_URL}.git" \
    org.opencontainers.image.ref.name=${VCS_REF} \
    org.opencontainers.image.revision=${VCS_REF} \
    org.opencontainers.image.base.name="ghcr.io/linuxserver/baseimage-alpine:${ALPINE_VERSION}" \
    org.opencontainers.image.base.version=${ALPINE_VERSION} \
    org.opencontainers.image.licenses=MIT
