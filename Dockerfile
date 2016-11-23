FROM alpine:3.4
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

ARG S6_OVERLAY_VERSION=v1.18.1.5

RUN add --update --no-cache curl bash && \
	curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xvfz - -C / && \
	apk del curl
	
ENTRYPOINT ["/init"]
CMD []
