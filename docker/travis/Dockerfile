FROM ruby:alpine

RUN apk --update add build-base git && \
    gem install travis && \
    apk del build-base &&\
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    mkdir project

WORKDIR project
VOLUME ["/project"]

LABEL maintainer="twitter.com/rcmoutinho"
LABEL description="Travis CLI in a docker container"

ENTRYPOINT ["travis"]
CMD ["--help"]
