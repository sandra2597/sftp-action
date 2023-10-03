#!/bin/sh -l

echo "Hello $1 $2 $3"
echo $LFTP_PASSWORD
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "<p>hello world from github actions</p>" > /app/index.html

mkdir "$HOME/.ssh" && touch "$HOME/.ssh/known_hosts"
ssh-keyscan -H ssh.strato.com >> ~/.ssh/known_hosts
lftp --env-password sftp://$2@$3 -e "mirror -R /app /app; bye"