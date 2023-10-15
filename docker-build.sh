#!/bin/bash
set -euxo pipefail

docker build -t ecerulm/buildah-ecr:latest .
