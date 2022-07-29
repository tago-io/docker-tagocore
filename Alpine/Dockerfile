FROM alpine
ENV TAGOCORE_VERSION=v0.5.0
ARG TARGETPLATFORM
# ARG BUILDPLATFORM

RUN apk add --update curl libstdc++

WORKDIR /

RUN case $TARGETPLATFORM in "linux/arm64") curl -o tagocore.tar.gz https://downloads.tagocore.com/${TAGOCORE_VERSION}/tagocore-${TAGOCORE_VERSION}-alpine-arm64.tar.gz ;; esac
RUN case $TARGETPLATFORM in "linux/amd64") curl -o tagocore.tar.gz https://downloads.tagocore.com/${TAGOCORE_VERSION}/tagocore-${TAGOCORE_VERSION}-alpine-x64.tar.gz ;; esac

RUN tar -xvzf tagocore.tar.gz
RUN mv tagocore /usr/bin
RUN rm -rf tagocore.tar.gz

EXPOSE 8888/tcp
EXPOSE 8999/tcp

ENTRYPOINT [ "tagocore" ]
CMD [ "start", "--no-daemon" ]
