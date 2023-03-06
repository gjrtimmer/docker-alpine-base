ARG DOCKER_PROXY
ARG ALPINE_VERSION
FROM ${DOCKER_PROXY}/linuxserver/baseimage-alpine:${ALPINE_VERSION}

RUN apk upgrade --update --no-cache && \
    apk add --update --force-overwrite --no-cache \
    curl \
    bash \
    git \
    tar \
    gzip \
    bzip2 \
    file \
    shadow \
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
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name=${CI_PROJECT_NAME} \
    org.label-schema.url="${CI_PROJECT_URL}" \
    org.label-schema.vcs-url="${CI_PROJECT_URL}.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.docker.image="${DOCKER_IMAGE}" \
    org.label-schema.alpine-version="${ALPINE_VERSION}" \
    org.label-schema.license=MIT
