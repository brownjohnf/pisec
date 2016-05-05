# PiSec

Network security camera using an off-the-shelf webcam, a Raspberry Pi, and
[Resin.io](https://resin.io).

# Dependencies

1. [Resin.io](https://resin.io)
1. [Mailgun](https://mailgun.com)
1. [Twilio](https://twilio.com)
1. 1 or more Raspberry Pis (only tested on model B+)
1. 1 webcam per Raspberry Pi

# Setup

1. Sign up with Resin.io
1. Create a Raspberry Pi application
1. Download the image
1. Flash the image to an SD card
1. Boot up the Pi
1. Sign up with [Mailgun](https://mailgun.com)
1. Follow their instructions, and note down the following:
  * API key
  * Domain
1. Sign up with [Twilio](https://twilio.com)
1. Follow their instructions for setting up SMS, and note the following:
  * Account SID
  * AUTH token
  * Caller ID (this will be a phone number)
1. Clone this repo
1. Copy the command to add a git remote and add the remote to your clone/fork
  of this repo
1. Run `git push resin master`
1. While the image is building/deploying, set the following environment
  variables for your Resin application:
  * `PISEC_CAMERA_NAME`: A human readable name for your camera
  * `PISEC_EMAIL_API_KEY`: A Mailgun API key
  * `PISEC_EMAIL_DOMAIN`: A Mailgun email domain
  * `PISEC_EMAIL_FROM`: Your FROM address for email
  * `PISEC_EMAIL_TO`: Your TO address for email
  * `PISEC_ENABLE_EMAIL`: Boolean whether or not to deliver email (true/false)
  * `PISEC_ENABLE_SMS`: Boolean whether or not to send SMS messages (true/false)
  * `PISEC_SMS_TO`: Phone number to which SMS should be sent (nnn-nnn-nnnn)
  * `TWILIO_ACCOUNT_SID`: A Twilio account SID
  * `TWILIO_AUTH_TOKEN`: A Twilio AUTH token
  * `TWILIO_CALLER_ID`: Your Twilio phone number from which you'll be sending
    messages (nnn-nnn-nnnn)
1. If everything has been set up properly, your device and camera should come
  on line, and start sending SMS when motion is detected, and emailing you the
  video after the motion has stopped.

# Configuration

## Video Feed

By default, you can access a real-time feed from the webcam at `http://<device-ip>:80`,
and a web configuration UI at `http://<device-ip>:8081`.

## Motion Alerts

By default, you will get an SMS whenever motion is detected, unless you set
`PISEC_ENABLE_EMAIL` to `false`. When motion has concluded (60s after frame
motion), you will get an email with the video attached. There's currently no
support for first-look photos of the motion accompanying the alert firing.

# Development

TODO

# TODO

* Add support for image/video uploading via FTP/SSH/S3/B2/etc.
* Add support for first-look delivery of a few photos immediately after motion
  is detected.

