# Description

This image is built multistage

First, `docker-credential-ecr-login` is compiled and then copied to the final
image.

The `docker-credential-ecr-login` comes from
https://github.com/awslabs/amazon-ecr-credential-helper#from-source

# How to use

```
docker run -ti --rm -v /dir/containing/the/Dockerfile/to/build:/build -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN ecerulm/buildah-ecr:latest
```

Inside the container:

```
echo '{"credHelpers": {"111111111111.dkr.ecr.us-east-1.amazonaws.com":"ecr-login"}}' > ~/.config/containers/config.json
cd build
buildah build -t 111111111111.dkr.ecr.us-east-1.amazonaws.com/xxxxx:latest .
buildah push 111111111111.dkr.ecr.us-east-1.amazonaws.com/xxxxx:latest
```

The `buildah push` step will use the `ecr-login` credential helper, to get the credentials for ECR.

In essence `buildah push` will invoke :

```
echo "111111111111.dkr.ecr.us-east-1.amazonaws.com" | docker-credential-ecr-login get
{
    "ServerURL":"111111111111.dkr.ecr.us-east-1.amazonaws.com",
    "Username":"AWS",
    "Secret":"<a JTW token>"
}
```

which returns a JSON with `.ServerURL`, `.Username`, `.Secret`.
