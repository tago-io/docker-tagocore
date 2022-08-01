FROM ubuntu:jammy

ARG TAGOCORE_VERSION
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building v$TAGOCORE_VERSION for $TARGETPLATFORM" > /lo

RUN apt-get update && apt-get install -y \
    curl \
    libatomic1

WORKDIR /

RUN case $TARGETPLATFORM in "linux/arm64") curl -o tagocore.tar.gz https://downloads.tagocore.com/v${TAGOCORE_VERSION}/tagocore-v${TAGOCORE_VERSION}-linux-arm64.tar.gz ;; esac
RUN case $TARGETPLATFORM in "linux/amd64") curl -o tagocore.tar.gz https://downloads.tagocore.com/v${TAGOCORE_VERSION}/tagocore-v${TAGOCORE_VERSION}-linux-x64.tar.gz ;; esac
RUN case $TARGETPLATFORM in "linux/arm/v7") curl -o tagocore.tar.gz https://downloads.tagocore.com/v${TAGOCORE_VERSION}/tagocore-v${TAGOCORE_VERSION}-linux-armv7.tar.gz ;; esac

RUN tar -xvzf tagocore.tar.gz
RUN mv tagocore /usr/bin
RUN rm -rf tagocore.tar.gz

EXPOSE 8888/tcp
EXPOSE 8999/tcp

ENTRYPOINT [ "tagocore" ]
CMD [ "start", "--no-daemon" ]
