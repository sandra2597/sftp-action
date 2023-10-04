#!/bin/sh -l

echo "Hello $INPUT_FTP_DOMAIN $INPUT_FTP_HOST $INPUT_SOURCE"
echo $LFTP_PASSWORD
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "<p>hello world from github actions</p>" > /app/index.html
ls "/github/workspace/$INPUT_SOURCE"

echo "writing fingerprint"
mkdir "/root/.ssh"
ssh-keyscan -H ssh.strato.com > /root/.ssh/known_hosts

echo "printing fingerpint"
cat /root/.ssh/known_hosts
echo "Connecting"
lftp --env-password sftp://$INPUT_FTP_DOMAIN@$INPUT_FTP_HOST -e "debug; mirror -R /github/workspace/$INPUT_SOURCE /app; bye"