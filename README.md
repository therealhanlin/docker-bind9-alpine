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
