FROM busybox

MAINTAINER Erik Kaareng-sunde <esu@enonic.com>

RUN mkdir -p /enonic-xp/home
RUN adduser -h /enonic-xp/ -H -u 1337 -D -s /bin/sh enonic-xp
RUN chown -R enonic-xp /enonic-xp/
VOLUME /enonic-xp/home
