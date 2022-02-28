FROM alpine/bombardier

RUN apk add --update supervisor && rm  -rf /tmp/* /var/cache/apk/*
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/

ENTRYPOINT []
CMD ["/usr/bin/supervisord"]
