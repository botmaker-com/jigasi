#!/usr/bin/with-contenv bash

##Based on https://github.com/jitsi/docker-jitsi-meet/blob/master/jigasi/rootfs/etc/cont-init.d/10-config

export SENTRY_RELEASE="${SENTRY_RELEASE:-$(apt-cache policy jigasi | sed -n '/Installed/p' | sed -e 's/[^:]*: //')}"

if [[ -z $JIGASI_XMPP_PASSWORD ]]; then
    echo 'FATAL ERROR: Jigasi auth password must be set'
    exit 1
fi

OLD_JIGASI_XMPP_PASSWORD=passw0rd
if [[ "$JIGASI_XMPP_PASSWORD" == "$OLD_JIGASI_XMPP_PASSWORD" ]]; then
    echo 'FATAL ERROR: Jigasi auth password must be changed, check the README'
    exit 1
fi

tpl /defaults/logging.properties > /config/logging.properties
tpl /defaults/sip-communicator.properties > /config/sip-communicator.properties

if [[ -f /config/custom-sip-communicator.properties ]]; then
    cat /config/custom-sip-communicator.properties >> /config/sip-communicator.properties
fi

mkdir -pm777 /tmp/transcripts
chown jigasi:jitsi /tmp/transcripts

# Botmaker's Custom part

# Create Google Cloud Credentials
cat $GOOGLE_APPLICATION_CREDENTIALS > /config/key.json
