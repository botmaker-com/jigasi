FROM jitsi/jigasi

ADD  ./customConfig.sh /etc/cont-init.d/10-config

ADD ./file.java /usr/share/jigasi/jigasi.jar
