#!/bin/bash
[[ ! -d /config/www/webui/.git ]] && (git clone https://github.com/Novik/ruTorrent.git /config/www/webui && \
chown -R abc:abc /config/www)


# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /config/www || exit
git pull
chown -R abc:abc /config/www
