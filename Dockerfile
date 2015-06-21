FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add lighttpd

EXPOSE 8081

RUN rm /var/cache/apk/*
RUN mkdir /var/run/lighttpd/
RUN chown lighttpd /var/run/lighttpd/

ADD ./lighttpd.conf /etc/lighttpd/lighttpd.conf

USER lighttpd
CMD /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
