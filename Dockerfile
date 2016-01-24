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
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# ports and volumes
EXPOSE 9527 45566-45576
VOLUME /config /downloads








