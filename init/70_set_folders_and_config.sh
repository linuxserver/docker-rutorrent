#!/bin/bash
mkdir -p /config/rtorrent /config/log/rtorrent
if [ ! -f "/config/rtorrent/config.php" ]; then
cp /defaults/config.php /config/rtorrent/config.php
fi
cp /config/rtorrent/config.php  /config/www/webui/conf/config.php

if [ ! -f "/config/rtorrent/rtorrent.rc" ]; then
cp /defaults/rtorrent.rc /config/rtorrent/rtorrent.rc
fi

if [ ! -d "/config/rtorrent/rtorrent_sess" ]; then
mkdir -p /config/rtorrent/rtorrent_sess
fi

if [ ! -d "/detach_sess" ]; then
mkdir -p /detach_sess
fi

chown abc:abc -R /config /detach_sess
chown abc:abc /downloads
