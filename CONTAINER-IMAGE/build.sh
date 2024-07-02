#!/bin/bash

# Source the Git token from a specific location
source ../../gitToken.sh

# Define variables
IMAGE_NAME="danielmarom78/Kaizen"   # Change this to your GitHub username/repository
IMAGE_TAG="latest"                     # Tag for your image, change as required
REGISTRY="ghcr.io"                     # GitHub Container Registry
FULL_IMAGE_NAME="$REGISTRY/$IMAGE_NAME:$IMAGE_TAG"

# Step 1: Build the container image
echo "Building the container image..."
podman build -t $IMAGE_NAME:$IMAGE_TAG .

# Step 2: Login to GitHub Container Registry
echo "Logging in to GitHub Container Registry..."
podman login $REGISTRY -u USERNAME -p $GIT_TOKEN # Replace USERNAME with your actual GitHub username

# Step 3: Tag the image for GitHub
echo "Tagging the image..."
podman tag $IMAGE_NAME:$IMAGE_TAG $FULL_IMAGE_NAME

# Step 4: Push the image to GitHub
echo "Pushing the image to GitHub Container Registry..."
podman push $FULL_IMAGE_NAME

echo "Image pushed successfully to $FULL_IMAGE_NAME"