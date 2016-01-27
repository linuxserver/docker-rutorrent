#!/bin/bash

# get webui
[[ ! -d /config/www/webui/.git ]] && (git clone https://github.com/Novik/ruTorrent.git /config/www/webui && \
chown -R abc:abc /config/www)


# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

# update webui
cd /config/www/webui || exit
git pull
chown -R abc:abc /config/www
