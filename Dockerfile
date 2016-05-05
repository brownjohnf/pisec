FROM resin/rpi-raspbian:jessie-20160427

RUN           apt-get update
RUN           apt-get install -y \
                motion
CMD           cat /etc/motion/motion.conf

CMD           lsusb

