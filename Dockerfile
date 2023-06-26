FROM jitsi/jigasi:stable-7648-1

ADD  ./customConfig.sh /etc/cont-init.d/10-config

ADD ./jigasi.sh /usr/share/jigasi/jigasi.sh

ADD ./output.wav /output.wav

RUN chmod +x /usr/share/jigasi/jigasi.sh

ADD ./jigasi.jar /usr/share/jigasi/
