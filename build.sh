#!/bin/bash

TAGOCOREVERSION=$arg

# docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag your-username/multiarch-example:buildx-latest .
# docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag your-username/multiarch-example:buildx-latest .


# # Alpine
# cd Alpine; docker buildx build --platform linux/arm64/v8,linux/amd64 --tag your-username/multiarch-example:buildx-latest .

# Linux
cd Linux; docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag tagoio/tagocore:buildx-latest --tag tagoio/tagocore:0.6.0-buster --tag tagoio/tagocore:0-buster .
