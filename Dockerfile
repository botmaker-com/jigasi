FROM jitsi/jigasi

ADD  ./customConfig.sh /etc/jitsi/jigasi/config

ADD ./file.java /usr/share/jigasi/jigasi.jar
