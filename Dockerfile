FROM alpine
MAINTAINER Faruk Brbovic <darkgaro@me.com>

ENV CONFD_VERSION="0.13.0-alpha1" \
    CONFD_URL="https://github.com/fbrbovic/confd/releases/download" \

VOLUME /etc/confd/

RUN mkdir -p /etc/confd/conf.d/  && mkdir -p /etc/confd/templates/

RUN apk update && apk add curl  \
    && apk add --update bash && cd /tmp \
    && curl -o /confd -L ${CONFD_URL}/v${CONFD_VERSION}/confd-linux-amd64  \
    && chmod 755 /confd \
    && apk del --purge deps 
 

ENTRYPOINT ["/bin/confd"]
