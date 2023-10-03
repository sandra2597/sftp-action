#!/bin/sh -l

echo "Hello $1 $2 $3"
echo $LFTP_PASSWORD
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "<p>hello world from github actions</p>" > /app/index.html

ssh-keyscan -H ssh.strato.com > ~/.ssh/known_hosts
echo ~/.ssh/known_hosts
cat ~/.ssh/known_hosts
lftp --env-password sftp://$2@$3 -e "debug; mirror -R /app /app; bye"