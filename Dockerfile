FROM jitsi/jigasi

ADD  ./customConfig.sh /etc/cont-init.d/10-config

ADD ./jigasi.jar /usr/share/jigasi/
