#!/bin/bash

set -o allexport
source .env
set +o allexport

ARCH=$(uname -m)

if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
fi

docker build \
    --build-arg ARCH="$ARCH" \
    -t $IMAGE_NAME --no-cache .

if [ $? -ne 0 ]; then
    echo "ERROR: Docker build failed."
    exit 1
fi

if [ -z "$MACHINE_NAME" ]; then
        docker run -it --name $CONTAINER_NAME $IMAGE_NAME
    else
        docker run -it --name $CONTAINER_NAME -e MACHINE_NAME="$MACHINE_NAME" $IMAGE_NAME
fi

