#!/bin/bash

BASE_DIR=$(pwd)

for dir in "$BASE_DIR"/*/; do

    if [[ -f "$dir/Dockerfile" ]]; then
        echo "Dockerfile found in: $dir"

        CONTAINER_NAME=$(basename "$dir")
        
        IMAGE_NAME="${CONTAINER_NAME}_image"
        echo "Create Image: $IMAGE_NAME"
        docker build -t "$IMAGE_NAME" "$dir"
        
        echo "Run Container: $CONTAINER_NAME"
        docker run --name "$CONTAINER_NAME" -d -p 0.0.0.0::5000 "$IMAGE_NAME"
        HOST_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "5000/tcp") 0).HostPort}}' "$CONTAINER_NAME")
        echo "Container running on Host-Port: $HOST_PORT"
    else
        echo "No Dockerfile found in: $dir, skip..."
    fi
done
