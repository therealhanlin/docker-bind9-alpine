# BIND 9 Docker image running on Alpine Linux #

[![Build Status](https://cloud.drone.io/api/badges/mjkaye/docker-bind9-alpine/status.svg)](https://cloud.drone.io/mjkaye/docker-bind9-alpine)

[![Docker pulls](https://img.shields.io/docker/pulls/mjkaye/bind9-alpine.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/mjkaye/bind9-alpine)

[![BIND version](https://img.shields.io/badge/Bind9%20version-9.14.8r5-blue.svg?style=for-the-badge)](https://www.isc.org/bind/)
[![Alpine version](https://img.shields.io/badge/Alpine%20version-3.11.6-blue.svg?style=for-the-badge)](https://alpinelinux.org/)

[![Github repository](https://img.shields.io/static/v1.svg?style=for-the-badge&color=blue&label=source%20code&message=docker-bind9-alpine&logo=github&logoColor=FFFFFF)](https://www.github.com/mjkaye/docker-bind9-alpine)

## What is BIND? ##

BIND (also called "named") is the first, oldest, and most widely deployed DNS solution. It's the de facto standard on Unix-like operating systems. It is currently developed by the Internet Software Consortium.

## What is Alpine Linux? ##

Alpine Linux is built around musl libc and busybox. This makes it smaller and more resource efficient, the base image only being 5MiB in size. It's a perfect fit for the Docker ecosystem.

## Supported architectures ##

| Architecture  | Tag          |
| ---           | ---          |
| amd64/x86_64  | latest-amd64 |
| arm32v7/armhf | latest-arm   |
| aarch64/arm64 | latest-arm64 |

## How to use this image: ##

```bash
docker run -d \
  --name bind9 \
  -p 53:53 \
  -p 53:53/udp \
  -v /path/to/named.conf:/etc/bind/named.conf \
  -v /path/to/example.com.zone:/var/bind/pri/example.com.zone \
  mjkaye/bind9-alpine
```

### Parameters ###

Container images are configured using parameters passed at run-time (such as those above). These parameters are separated by a colon and indicate `<host>:<container>` respectively. For example, `-p 8053:53` would expose TCP port `53` from inside the container to be accessible from the host's IP on port `8053`. Similarly, when mapping volumes with the `-v` option, host paths to left of the colon are mapped to the container paths to the right of the colon.

| Parameter                            | Function                                                   |
| ---                                  | ---                                                        |
| `-p 53:53`                           | container's BIND will listen on host's TCP port 53         |
| `-p 53:53/udp`                       | container's BIND will listen on host's UDP port 53         |
| `-v :/etc/bind/named.conf`           | maps BIND configuration file to specified path on the host |
| `-v :/var/bind/pri/example.com.zone` | maps zone file between container and host (optional)       |

### named.conf ###

The following directives should be set in your named.conf.

| Directive and value                    | Notes                            |
| ---                                    | ---                              |
| `directory "/var/bind";`               |                                  |
| `pid-file "/var/run/named/named.pid";` |                                  |
| `listen-on { 172.17/16; };`            | if you're running in normal mode |
| `listen-on { 10/8; };`                 | if you're running in swarm mode  |

Zone files should be included in the normal manner.

## Support ##

 * [BIND 9 documentation](https://bind9.readthedocs.io/en/latest/index.html)
 * [report BIND 9 bugs](https://gitlab.isc.org/isc-projects/bind9/issues)
 * [report bugs related to this Docker image](https://github.com/mjkaye/docker-bind9-alpine/issues)
 * [contribute to BIND](https://gitlab.isc.org/isc-projects/bind9/-/blob/master/CONTRIBUTING.md)

## Donate ##

[![Donate using Donorbox](https://img.shields.io/badge/usd,gbp,eur-265B79?logo=shopify&style=for-the-badge)](https://donorbox.org/docker-images)

---

[![Donate using Bitcoin](https://img.shields.io/badge/bitcoin-265B79?logo=bitcoin&style=for-the-badge)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=bc1q2acfmcwrqc9pzttqgwn6nd0t5cncleue6ukfrs)

bc1q2acfmcwrqc9pzttqgwn6nd0t5cncleue6ukfrs

---

[![Donate using Ethereum](https://img.shields.io/badge/ethereum-265B79?logo=ethereum&style=for-the-badge)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=0x95ab6d374ef0d3a84bb7c767cdf6c77b3b170ba2)

0x95ab6d374ef0d3a84bb7c767cdf6c77b3b170ba2

---

[![Donate using Dash](https://img.shields.io/badge/dash-265B79?logo=dash&style=for-the-badge)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=XxVEjb1uYFnBGLm59eytUHBDWAYTHeyrET)

XxVEjb1uYFnBGLm59eytUHBDWAYTHeyrET

---

[![Donate using Monero](https://img.shields.io/badge/monero-265B79?logo=monero&style=for-the-badge)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=49couTFdiXHhmodRY49DSt4uwLb5SK9d8QXoUQh6TmMgAmNhWVjtXzri1Qq2AWzTVxaYqbhbthXi1R7hKxM4cTvSFKrFcv1)

49couTFdiXHhmodRY49DSt4uwLb5SK9d8QXoUQh6TmMgAmNhWVjtXzri1Qq2AWzTVxaYqbhbthXi1R7hKxM4cTvSFKrFcv1

---

[![Donate using Groestlcoin](https://img.shields.io/badge/groestlcoin-265B79?&style=for-the-badge)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=grs1q4gu2xfg8q448tlajg8grqkrlw9rjvuz29vctmj)

grs1q4gu2xfg8q448tlajg8grqkrlw9rjvuz29vctmj

---
