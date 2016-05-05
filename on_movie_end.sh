#!/bin/bash

set -x

for i in $@; do
  echo $i
done

if [ "$PISEC_ENABLE_EMAIL" == "true" ]; then

  /usr/local/bin/mailgun.sh $@
  echo $?

else
  echo "--> Not sending email; Email disabled."
fi

