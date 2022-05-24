FROM jitsi/jigasi

ADD  ./customConfig.sh /etc/cont-init.d/10-config

ADD ./aspectjrt-1.9.7.jar ./aspectjweaver-1.9.7.jar /usr/share/jigasi/lib/

ADD ./jigasi.jar /usr/share/jigasi/
