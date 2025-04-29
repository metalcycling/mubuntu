#!/bin/bash

#
# Build Mubuntu image
#

# Copy files to current context

if [[ -z ${REPLACE_FILES} ]]; then
    REPLACE_FILES="yes"
fi

if [[ ${REPLACE_FILES} == "yes" ]]; then
    find . ! -name '.gitignore' ! -name 'Dockerfile' ! -name 'build.sh' ! -name '.' -exec rm -rf {} +
    cp -rf ../Files/. .
fi

exit

# Build image

if [[ $(uname -s) == "Darwin" ]]; then
    image="docker.io/metalcycling/mubuntu:macos"
    platform="linux/arm64"
else
    image="docker.io/metalcycling/mubuntu:linux"
    platform="linux/amd64"
fi

docker build --platform ${platform} --tag ${image} --file Dockerfile .
