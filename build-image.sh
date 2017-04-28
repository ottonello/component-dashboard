#!/bin/bash

set -xe

source image-version.sh

# Build the builder image
docker build -t pp-dashboard-builder -f build/Dockerfile.build .

# Build the pp-dashboard.tar.gz package
docker run --rm \
  -v "$PWD":/go/src/github.com/ottonello/component-status-dashboard \
  pp-dashboard-builder

# Build the final image
echo "Building $IMAGE_NAME:$IMAGE_VERSION ..."
docker build \
  --build-arg IMAGE_VERSION=$IMAGE_VERSION \
  --build-arg IMAGE_NAME=$IMAGE_NAME \
  -t $IMAGE_NAME:$IMAGE_VERSION \
  -t $IMAGE_NAME:latest .

rm -vf component-dashboard.tar.gz

echo "Build done."
