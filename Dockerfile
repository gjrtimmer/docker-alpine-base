ARG DOCKER_IMAGE_FROM
FROM ${DOCKER_IMAGE_FROM}

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
    org.label-schema.vendor=timmertech.nl \
    org.label-schema.url="${CI_PROJECT_URL}" \
    org.label-schema.vcs-url="${CI_PROJECT_URL}.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.docker.image="${DOCKER_IMAGE}" \
    org.label-schema.alpine-version="${ALPINE_VERSION}" \
    org.label-schema.license=MIT

ENV S6_OVERLAY_VERSION=v2.2.0.3 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    ALPINE_VERSION=${ALPINE_VERSION}

RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache \
        curl \
        bash \
        git \
        tar \
        gzip \
        bzip2 \
        file \
        ca-certificates && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar -xzf - -C /

ENTRYPOINT ["/init"]

# EOF