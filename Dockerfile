FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add lighttpd

EXPOSE 8081

RUN rm /var/cache/apk/*

ADD ./lighttpd.conf /etc/lighttpd/lighttpd.conf

#USER tor
CMD /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
