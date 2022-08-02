#!/bin/bash

FULL_VERSION=$1

SPLIT=(${FULL_VERSION//./ })
MAJOR=${SPLIT[0]}
MINOR=${SPLIT[1]}
PATCH=${SPLIT[2]}

# Alpine
cd alpine;
docker buildx build --push --build-arg TAGOCORE_VERSION=${FULL_VERSION} \
    --platform linux/arm64/v8,linux/amd64 \
    --tag tagoio/tagocore:alpine \
    --tag tagoio/tagocore:${MAJOR}.${MINOR}-alpine  \
    --tag tagoio/tagocore:${MAJOR}.${MINOR}.${PATCH}-alpine .;
cd ..;

# Debian
cd debian;
docker buildx build --push --build-arg TAGOCORE_VERSION=${FULL_VERSION} \
    --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
    --tag tagoio/tagocore \
    --tag tagoio/tagocore:debian \
    --tag tagoio/tagocore:bullseye \
    --tag tagoio/tagocore:${MAJOR}.${MINOR}-bullseye  \
    --tag tagoio/tagocore:${MAJOR}.${MINOR}.${PATCH}-bullseye \
    --tag tagoio/tagocore:${MAJOR}.${MINOR}  \
    --tag tagoio/tagocore:${MAJOR}.${MINOR}.${PATCH} .
