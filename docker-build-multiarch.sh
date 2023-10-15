#!/bin/bash
set -euxo pipefail

docker buildx build --push --builder  intel_and_apple_silicon --platform linux/arm64/v8,linux/amd64 --tag ecerulm/buildah-ecr:latest .
