#!/bin/bash

_logout() {
  docker logout
}

trap _logout EXIT TERM

docker login -u "${DOCKER_HUB_USERNAME}" -p "${DOCKER_HUB_PASSWORD}"
docker build -t "${DOCKER_HUB_USERNAME}/mastodon:${TRAVIS_TAG}" .
docker push "${DOCKER_HUB_USERNAME}/mastodon:${TRAVIS_TAG}"
