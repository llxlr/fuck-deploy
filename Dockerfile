FROM alpine:latest
LABEL "maintainer"="jamesyang <i@xhlr.top>"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
  apk update && \
  apk add --no-cache openssh-client sshpass rsync

ENTRYPOINT ["/entrypoint.sh"]
