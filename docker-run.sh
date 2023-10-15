#!/bin/bash

set -euxo pipefail

docker run -ti --rm -v "$HOME/.aws:/root/.aws" -e AWS_PROFILE ecerulm/buildah-ecr:latest
