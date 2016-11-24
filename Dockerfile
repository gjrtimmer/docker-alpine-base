FROM alpine:3.4
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

ARG S6_OVERLAY_VERSION=v1.18.1.5

# Terminate container if init scripts fails
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN apk add --update --no-cache curl bash && \
	curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C / && \
	apk del curl
	
ENTRYPOINT ["/init"]
CMD []
