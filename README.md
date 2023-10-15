# Description

This image is built multistage

First, `docker-credential-ecr-login` is compiled and then copied to the final
image.

The `docker-credential-ecr-login` comes from
https://github.com/awslabs/amazon-ecr-credential-helper#from-source
