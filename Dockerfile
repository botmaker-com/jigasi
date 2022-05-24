FROM jitsi/jigasi

ADD  ./customConfig.sh /etc/cont-init.d/10-config

ADD ./jigasi.sh /usr/share/jigasi/jigasi.sh

RUN chmod +x /usr/share/jigasi/jigasi.sh

ADD ./jigasi.jar /usr/share/jigasi/
