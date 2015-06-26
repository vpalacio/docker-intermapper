#!/bin/bash
set -x

# http://static.helpsystems.com/intermapper/readme/im582/ReadMeFirst5.8.2-RedHat.html?_ga=1.41703910.535137701.1434589145
# "Configuring InterMapper Remotely"

# Use env var "CLIENT" or else a default, promiscuous value.
CLIENT=${CLIENT:-remote:password@*.*.*.*}
exec /usr/local/bin/intermapperd \
     -f /usr/local/etc/intermapperd.conf \
     -A ${CLIENT} \
     --no-daemonize \
     --no-ssl \
     --debug
