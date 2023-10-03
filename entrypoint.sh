#!/bin/sh -l

echo "Hello $1 $2 $3"
echo $LFTP_PASSWORD
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "<p>hello world from github actions</p>" > /app/index.html

lftp --env-password sftp://$2@$3 -e "mirror -R /app /app; bye"