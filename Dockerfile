ARG TARGETARCH
# hadolint ignore=DL3007,DL3029
FROM --platform=linux/${TARGETARCH} harbor.local/docker.io/alpine:latest AS builder

# hadolint ignore=DL3018
RUN apk add --no-cache --force-overwrite --update \
    curl \
    wget \
    bash \
    coreutils \
    findutils \
    git \
    tar \
    gzip \
    bzip2 \
    file \
    shadow \
    findutils \
    openssl \
    jq \
    yq \
    moreutils \
    ca-certificates && \
    update-ca-certificates && \
    mkdir /work

RUN mkdir -p /var/run/s6 /run/s6 /run/s6/container_environment

# Compress Image
FROM scratch AS runtime
COPY --from=builder / /

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    PS1="$(whoami)@$(hostname):$(pwd)\\$ " \
    HOME=/work \
    TERM=xterm

WORKDIR "/work"
CMD [ "/bin/bash" ]

ARG BUILD_DATE
ARG CI_PROJECT_NAME
ARG CI_PROJECT_URL
ARG VCS_REF

LABEL maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>"
LABEL org.opencontainers.image.version="${BUILD_DATE}"
LABEL org.opencontainers.image.authors="G.J.R. Timmer <gjr.timmer@gmail.com>"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.title="${CI_PROJECT_NAME}"
LABEL org.opencontainers.image.url="${CI_PROJECT_URL}"
LABEL org.opencontainers.image.documentation="${CI_PROJECT_URL}"
LABEL org.opencontainers.image.source="${CI_PROJECT_URL}.git"
LABEL org.opencontainers.image.ref.name=${VCS_REF}
LABEL org.opencontainers.image.revision=${VCS_REF}
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.vendor=timmertech.nl
