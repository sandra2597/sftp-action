# Container image that runs your code
FROM alpine:3.10

RUN ssh-keyscan -H ssh.strato.com >> ~/.ssh/known_hosts
RUN mkdir /app

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
