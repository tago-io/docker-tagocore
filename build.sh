#!/bin/bash

FULL_VERSION=$1

SPLIT=(${FULL_VERSION//./ })
MAJOR=${SPLIT[0]}
MINOR=${SPLIT[1]}
PATCH=${SPLIT[2]}

# Alpine
cd Alpine;
docker buildx build --push --build-arg TAGOCORE_VERSION=${FULL_VERSION} \
    --platform linux/arm64/v8,linux/amd64 \
    --tag tago-io/tagocore:alpine \
    --tag tago-io/tagocore:${MAJOR}.${MINOR}-alpine  \
    --tag tago-io/tagocore:${MAJOR}.${MINOR}.${PATCH}-alpine .;
cd ..;

# Linux
cd Linux;
docker buildx build --push --build-arg TAGOCORE_VERSION=${FULL_VERSION} \
    --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
    --tag tago-io/tagocore \
    --tag tago-io/tagocore:jammy \
    --tag tago-io/tagocore:${MAJOR}.${MINOR}-jammy  \
    --tag tago-io/tagocore:${MAJOR}.${MINOR}.${PATCH}-jammy .
