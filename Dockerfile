FROM alpine:latest

MAINTAINER Simple Patrick <public@simplepatrick.com>

RUN apk add --no-cache bind

EXPOSE 53

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
