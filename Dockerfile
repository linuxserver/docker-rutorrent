FROM linuxserver/baseimage.nginx

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

ENV APTLIST="dtach ffmpeg git-core mediainfo nano php5-geoip \
rtorrent unrar unzip wget"

# install packages
RUN add-apt-repository ppa:kirillshkrogalev/ffmpeg-next && \
add-apt-repository -y ppa:jalaziz/rtorrent && \
apt-get update -q && \
apt-get install $APTLIST -qy && \ 

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Adding Custom files
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh && \

# configure php
sed -i 's#;upload_tmp_dir =#upload_tmp_dir = /config/tmp#g' /etc/php5/fpm/php.ini

# ports and volumes
EXPOSE 80 9527 45566-45576
VOLUME /config /downloads








