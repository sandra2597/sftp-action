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

lftp --env-password sftp://${INPUT_FTP_DOMAIN}@${INPUT_FTP_HOST} -e "put /github/workspace/$INPUT_SOURCE/webapp.tar.gz; bye"

sshpass -p $LFTP_PASSWORD ssh ${INPUT_FTP_DOMAIN}@${INPUT_FTP_HOST} 'bash unpack.sh dev'