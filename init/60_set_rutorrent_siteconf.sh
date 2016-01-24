#!/bin/bash
if [ -f "/config/nginx/site-confs/default" ]; then
rm /config/nginx/site-confs/default
cp /defaults/rutorrent.www /config/nginx/site-confs/rutorrent
fi
chown abc:abc /config/nginx/site-confs/rutorrent
