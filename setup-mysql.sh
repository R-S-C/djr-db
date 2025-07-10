#!/bin/bash

## setup.sh - Setup a container dev environment via MySQL docker image

NAME="djr-dev-db"
PASS="password"
PORT="3306:3306"

IMAGE="mysql:latest"

docker run \
    -d \
    --name "$NAME" \
    -e MYSQL_ROOT_PASSWORD="$PASS" \
    -p "$PORT" \
    $IMAGE
