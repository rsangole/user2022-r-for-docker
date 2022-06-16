#!/usr/bin/env bash

echo "\033[0;92mStart to build the docker"
echo "\033[0;92mTag: 0.1.0.9000"

docker build . -t rkrispin/package_template_dev:0.1.0.9000

# Pushing the docker to Docker Hub
# Use "docker login" to login to your account 
if [[ $? = 0 ]] ; then
echo "\033[0;92mPushing docker..."
docker push rkrispin/package_template_dev:0.1.0.9000
else
echo "\033[0;91mmDocker build failed"
fi