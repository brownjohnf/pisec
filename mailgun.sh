#!/bin/bash

set -x

echo "--> Sending email with attachment: $1"

ls -lah /data

curl -s -k \
  --user "api:$PISEC_EMAIL_API_KEY" \
  https://api.mailgun.net/v3/$PISEC_EMAIL_DOMAIN/messages \
  -F from=$PISEC_EMAIL_FROM \
  -F to=$PISEC_EMAIL_TO \
  -F subject='PiSec Movie' \
  -F text='Security footage attached.' \
  -F attachment=@$1

echo $?
