# Container image that runs your code
FROM compose:2.6
RUN apk add lftp openssh
RUN composer global require "laravel/installer=~1.1"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
