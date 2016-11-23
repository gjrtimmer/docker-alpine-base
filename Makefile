all: build

build:
	@docker build --tag=$(shell cat REPOSITORY)/docker/alpine-base .

release: build
	@docker build --tag=$(shell cat REPOSITORY)/docker/alpine-base:$(shell cat VERSION) .
