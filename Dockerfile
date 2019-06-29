FROM alpine:3.10

RUN set -x && \
    set -e && \
    apk add --no-cache ca-certificates && \
    rm -rf /var/cache/apk/* 

COPY sql-migrate /usr/local/bin
