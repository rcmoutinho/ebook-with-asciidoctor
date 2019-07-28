FROM node:lts-alpine

RUN apk --update add git \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && echo 'git version  => '$(git --version) \
    && echo 'npm version  => '$(npm -v) \
    && echo 'node version => '$(node -v) \
    && mkdir app

WORKDIR app
VOLUME ["/app"]

LABEL maintainer="twitter.com/rcmoutinho"

ENTRYPOINT ["npm"]
CMD ["--help"]
