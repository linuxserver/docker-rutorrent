#!/bin/bash

mkdir -p /config/rtorrent/rtorrent_sess /config/log/rtorrent /detach_sess

[[ ! -f /config/rtorrent/config.php ] && cp /defaults/config.php /config/rtorrent/config.php
[[ ! -L /config/www/webui/conf/config.php && -f /config/www/webui/conf/config.php ]] && rm /config/www/webui/conf/config.php
[[ ! -L /config/www/webui/conf/config.php ]] && ln -s /config/rtorrent/config.php /config/www/webui/conf/config.php


[[ ! -f /config/rtorrent/rtorrent.rc ]] && cp /defaults/rtorrent.rc /config/rtorrent/rtorrent.rc

chown abc:abc -R /config /detach_sess
chown abc:abc /downloads
