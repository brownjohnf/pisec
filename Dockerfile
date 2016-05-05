FROM resin/rpi-raspbian:jessie-20160427

RUN           apt-get update && \
              apt-get install -y \
                motion \
                curl && \
              apt-get clean

COPY          motion.conf /etc/motion/.
COPY          on_event_start.sh /usr/local/bin/.
COPY          on_movie_end.sh /usr/local/bin/.
COPY          twilio-sms.sh /usr/local/bin/.
COPY          mailgun.sh /usr/local/bin/.

ENTRYPOINT    ["/usr/bin/motion", "-n"]

