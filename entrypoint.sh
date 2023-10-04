#!/bin/sh -l

echo "Hello $1 $2 $3"
echo $LFTP_PASSWORD
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "<p>hello world from github actions</p>" > /app/index.html

echo "writing fingerprint"
mkdir "/root/.ssh"
ssh-keyscan -t rsa ssh.strato.com > /root/.ssh/known_hosts

echo "printing fingerpint"
cat /root/.ssh/known_hosts
echo "Connecting"
lftp --env-password sftp://$2@$3 -e "debug; mirror -R /app /app; bye"