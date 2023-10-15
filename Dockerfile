FROM  golang:1.19 as docker-credential-ecr-login

RUN go install github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest

FROM quay.io/buildah/stable:v1.32.0

ENV BUILDAH_ISOLATION=chroot

# https://github.com/containers/buildah/blob/main/docs/buildah.1.md --storage-drive vfs / STORAGE_DRIVER=vfs
ENV STORAGE_DRIVER=vfs
ENV BUILDAH_FORMAT=docker

RUN yum -y install awscli2 less && yum -y clean all  && rm -rf /var/cache

COPY --from=docker-credential-ecr-login /go/bin/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
