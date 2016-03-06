#!/bin/bash

# make folders
mkdir -p /config/tmp /config/rtorrent/rtorrent_sess /config/log/rtorrent /detach_sess

# copy config files/set links etc...
[[ ! -f /config/rtorrent/config.php ]] && cp /defaults/config.php /config/rtorrent/config.php
[[ ! -L /config/www/webui/conf/config.php && -f /config/www/webui/conf/config.php ]] && rm /config/www/webui/conf/config.php
[[ ! -L /config/www/webui/conf/config.php ]] && ln -s /config/rtorrent/config.php /config/www/webui/conf/config.php
[[ ! -f /config/rtorrent/rtorrent.rc ]] && cp /defaults/rtorrent.rc /config/rtorrent/rtorrent.rc

# set perms
chown abc:abc -R /config /detach_sess
chown abc:abc /downloads
