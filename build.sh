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
    --tag matheuslbenachio/test-app:alpine \
    --tag matheuslbenachio/test-app:${MAJOR}.${MINOR}-alpine  \
    --tag matheuslbenachio/test-app:${MAJOR}.${MINOR}.${PATCH}-alpine .;
cd ..;

# Linux
cd Linux;
docker buildx build --push --build-arg TAGOCORE_VERSION=${FULL_VERSION} \
    --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
    --tag matheuslbenachio/test-app \
    --tag matheuslbenachio/test-app:jammy \
    --tag matheuslbenachio/test-app:${MAJOR}.${MINOR}-jammy  \
    --tag matheuslbenachio/test-app:${MAJOR}.${MINOR}.${PATCH}-jammy .
