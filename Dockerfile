FROM linuxserver/baseimage.nginx

MAINTAINER Mark Burford <sparklyballs@gmail.com>

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Set the locale
RUN locale-gen en_US.UTF-8

# repositories
RUN add-apt-repository ppa:kirillshkrogalev/ffmpeg-next && \
add-apt-repository -y ppa:jalaziz/rtorrent
# install packages
RUN  apt-get update &&\
apt-get -y install \ 
dtach \
ffmpeg \
git-core \
mediainfo \
nano \
php5-geoip \
rtorrent \
unrar \
unzip \
wget -qy && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# set the volumes
VOLUME /config /downloads

# expose ports
EXPOSE 9527 45566-45576

#Adding Custom files
RUN mkdir -p /defaults 
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
RUN if [ -f "/etc/my_init.d/20_update_base_apps.sh" ]; then echo "apt-get --only-upgrade install rtorrent -qqy" >> /etc/my_init.d/20_update_base_apps.sh ; else mv /defaults/22_update_apps.sh /etc/my_init.d/22_update_apps.sh ; fi
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh







