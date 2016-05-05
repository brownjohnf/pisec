#!/bin/bash

set -e
set -x

if [ "$PISEC_ENABLE_SMS" == "true" ]; then

  echo "PISEC ALERT
  camera: $PISEC_CAMERA_NAME
  event: event_start
  date: $(date)" | \
    /usr/local/bin/twilio-sms.sh \
      -u $TWILIO_ACCOUNT_SID \
      -p $TWILIO_AUTH_TOKEN \
      -d $TWILIO_CALLER_ID \
      "$PISEC_SMS_TO"
else
  echo "--> Not sending SMS; SMS disabled."
fi

