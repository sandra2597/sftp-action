#!/bin/sh -l

echo "Variables: ${INPUT_FTP_DOMAIN} ${INPUT_FTP_HOST} ${INPUT_SOURCE}"

echo "install packages"
cd /github/workspace/$INPUT_SOURCE/website
composer install
cd ../
tar cf webapp.tar.gz * 

echo "send files"
mkdir "/root/.ssh"
ssh-keyscan -H ssh.strato.com > /root/.ssh/known_hosts

lftp --env-password sftp://${INPUT_FTP_DOMAIN}@${INPUT_FTP_HOST} -e "mirror -R /github/workspace/$INPUT_SOURCE/webapp.tar.gz /$INPUT_TARGET; bye"