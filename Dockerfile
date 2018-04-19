FROM alpine:3.7

ARG S6_OVERLAY_VERSION=v1.21.4.0
ARG BUILD_DATE
ARG VCS_REF

LABEL \
	maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	nl.timmertech.build-date=${BUILD_DATE} \
	nl.timmertech.name=alpine-base \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.vcs-url="https://github.com/GJRTimmer/docker-alpine-base.git" \
	nl.timmertech.vcs-ref=${VCS_REF} \
	nl.timmertech.license=MIT

# Terminate container if init scripts fails
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN apk add --update --no-cache curl bash tar gzip file ca-certificates && \
	curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar -xzf - -C /

ENTRYPOINT ["/init"]
CMD []
