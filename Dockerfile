FROM alpine:latest
LABEL "maintainer"="jamesyang <i@xhlr.top>"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
