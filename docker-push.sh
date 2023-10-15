#!/bin/bash
set -euxo pipefail

source docker-build.sh
docker push ecerulm/buildah-ecr:latest
