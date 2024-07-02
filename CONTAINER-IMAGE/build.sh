#!/bin/bash

# Source the Git token from a specific location
source ../../gitToken.sh

# Define variables
IMAGE_NAME="danielmarom78/buildah-cosign"   # Change this to your GitHub username/repository
IMAGE_TAG="1.0"                     # Tag for your image, change as required
REGISTRY="ghcr.io"                     # GitHub Container Registry
FULL_IMAGE_NAME="$REGISTRY/$IMAGE_NAME:$IMAGE_TAG"

set -x

podman build -t $IMAGE_NAME:$IMAGE_TAG .
podman login $REGISTRY -u danielmarom78 -p $GIT_TOKEN
podman tag $IMAGE_NAME:$IMAGE_TAG $FULL_IMAGE_NAME
podman push $FULL_IMAGE_NAME
