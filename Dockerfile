# Container image that runs your code
FROM composer:2.6
RUN apk add lftp openssh sshpass
RUN composer global require "laravel/installer=~1.1"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY unpack.sh /gitbub/workspace/unpack.sh
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
