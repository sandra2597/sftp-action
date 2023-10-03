#!/bin/sh -l

echo "Hello $1 $2 $3"
echo $LFTP_PASSWORD
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

