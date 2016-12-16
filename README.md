[![build status](https://gitlab.timmertech.nl/docker/alpine-base/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-base/commits/master)

# Docker Alpine Linux

- [Docker Registries](#docker-registries)
- [Source Repositories](#source-repositories)
- [Installation](#installation)
  - [Docker Hub](#install-from-docker-hub)
  - [TimmerTech](#install-from-timmertech)


# Docker Registries

 - ```datacore/docker-alpine-base:latest``` (docker.com)
 - ```registry.timmertech.nl/docker/alpine-base:latest``` (registry.timmertech.nl)


# Source Repositories

- [https://github.com/GJRTimmer/docker-alpine-base](github.com)
- [https://gitlab.timmertech.nl/docker/alpine-base.git](gitlab.timmertech.nl)


# Installation

## Install from docker hub
Download:
```bash
docker pull datacore/docker-alpine-base:latest
```

Build:
```bash
docker build -t datacore/docker-alpine-base https://github.com/GJRTimmer/docker-alpine-base
```


## Install from timmertech

Download:
```bash
docker pull registry.timmertech.nl/docker/alpine-base:latest
```

Build:
```bash
docker build -t datacore/docker-alpine-base https://gitlab.timmertech.nl/docker/alpine-base
```
