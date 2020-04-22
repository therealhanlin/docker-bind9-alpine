FROM alpine:latest

MAINTAINER Michael Kaye <mjkaye@cuttingfree.info>

RUN apk add --no-cache bind

EXPOSE 53

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
