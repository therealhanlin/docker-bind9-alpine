![mjkaye's logo](https://gistcdn.githack.com/mjkaye/1c98964af75456ccfca37c2a9a105825/raw/d1ac0b27dc154eb5f26026be55cab124adfde4d2/mjkaye-gradient.svg)

# BIND 9 running on Alpine Linux #

[![Build Status](https://img.shields.io/drone/build/mjkaye/docker-bind9-alpine.svg?style=for-the-badge&logo=drone)](https://cloud.drone.io/mjkaye/docker-bind9-alpine)

[![BIND version](https://img.shields.io/badge/BIND%20version-9.14.12--r0-blue.svg?style=for-the-badge&logoColor=FFFFFF&color=878a00)](https://www.isc.org/bind/)
[![Alpine version](https://img.shields.io/badge/Alpine%20version-3.12.0-blue.svg?style=for-the-badge&logoColor=FFFFFF&color=878a00)](https://alpinelinux.org/)
[![Github repository](https://img.shields.io/badge/source_code-docker--bind9--alpine-878a00.svg?style=for-the-badge&logo=github&logoColor=FFFFFF&color=878a00)](https://www.github.com/mjkaye/docker-bind9-alpine)
[![Docker pulls](https://img.shields.io/docker/pulls/mjkaye/bind9-alpine.svg?style=for-the-badge&logo=docker&logoColor=FFFFFF&color=878a00)](https://hub.docker.com/r/mjkaye/bind9-alpine)

## What is BIND? ##

[![BIND9 logo](https://i.ibb.co/k5M6BW0/Bind-9-ISC-Blue-small.png)](https://www.isc.org/bind/)

BIND (also called "named") is the first, oldest, and most widely deployed DNS solution. It's the de facto standard on Unix-like operating systems. It is currently developed by the Internet Software Consortium.

## What is Alpine Linux? ##

[![Alpine Linux logo](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Alpine_Linux.svg/320px-Alpine_Linux.svg.png)](https://alpinelinux.org/)

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

## Changelog ##

* __9.14.12-r0:__ - Alpine release 3.12.0; bump BIND version to 9.14.12-r0.
* __9.14.8-r5:__ - Alpine release 3.11.6; bump BIND version to 9.14.8-r5; support architectures arm32v7, aarch64, and amd64; use --no-cache with apk add.

## Thank you ##

Thank you for using bind9-alpine.

Do you like this Docker image? Donations help me to devote more time to improving these images. My current focus is testing this in Swarm Mode and improving the documentation. Even the smallest donation is a big help.

[![Donate using Donorbox](https://img.shields.io/badge/usd,_gbp,_eur-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A&logo=cash%20app)](https://donorbox.org/docker-images)

---

[![Donate using Bitcoin](https://img.shields.io/badge/bitcoin-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A&logo=bitcoin)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=bc1q2acfmcwrqc9pzttqgwn6nd0t5cncleue6ukfrs)

bc1q2acfmcwrqc9pzttqgwn6nd0t5cncleue6ukfrs

---

[![Donate using Ethereum](https://img.shields.io/badge/ethereum-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A&logo=ethereum)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=0x95ab6d374ef0d3a84bb7c767cdf6c77b3b170ba2)

0x95ab6d374ef0d3a84bb7c767cdf6c77b3b170ba2

---

[![Donate using Dash](https://img.shields.io/badge/dash-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A&logo=dash)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=XxVEjb1uYFnBGLm59eytUHBDWAYTHeyrET)

XxVEjb1uYFnBGLm59eytUHBDWAYTHeyrET

---

[![Donate using Monero](https://img.shields.io/badge/monero-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A&logo=monero)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=49couTFdiXHhmodRY49DSt4uwLb5SK9d8QXoUQh6TmMgAmNhWVjtXzri1Qq2AWzTVxaYqbhbthXi1R7hKxM4cTvSFKrFcv1)

49couTFdiXHhmodRY49DSt4uwLb5SK9d8QXoUQh6TmMgAmNhWVjtXzri1Qq2AWzTVxaYqbhbthXi1R7hKxM4cTvSFKrFcv1

---

[![Donate using Groestlcoin](https://img.shields.io/badge/groestlcoin-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=grs1q4gu2xfg8q448tlajg8grqkrlw9rjvuz29vctmj)

grs1q4gu2xfg8q448tlajg8grqkrlw9rjvuz29vctmj

---

[![Donate using NANO](https://img.shields.io/badge/NANO-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=nano_1ro9tk49hje9f31r6x869z18rgbiertsc1jgw6siqb6c9cziywk1u4zq766z)

nano_1ro9tk49hje9f31r6x869z18rgbiertsc1jgw6siqb6c9cziywk1u4zq766z

---

[![Donate using TRON](https://img.shields.io/badge/TRON-00578A?style=for-the-badge&logoColor=FFFFFF&labelColor=00578A)](https://www.freeformatter.com/qr-code?w=350&h=350&e=Q&c=TTna1P4yTLueZAunmxAu4p4qYZGQ28VTYE)

TTna1P4yTLueZAunmxAu4p4qYZGQ28VTYE

---
