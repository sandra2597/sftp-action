#!/bin/sh -l

echo "Variables: ${INPUT_FTP_DOMAIN} ${INPUT_FTP_HOST} ${INPUT_SOURCE}"
mkdir "/root/.ssh"
ssh-keyscan -H ssh.strato.com > /root/.ssh/known_hosts
lftp --env-password sftp://${INPUT_FTP_DOMAIN}@${INPUT_FTP_HOST} -e "mirror -R /github/workspace/$INPUT_SOURCE /$INPUT_TARGET; bye"