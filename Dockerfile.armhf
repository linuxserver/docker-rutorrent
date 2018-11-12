FROM lsiobase/alpine.nginx:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

# copy patches
COPY patches/ /defaults/patches/

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	bind-tools \
	curl \
	fcgi \
	ffmpeg \
	geoip \
	gzip \
	mediainfo \
	php7 \
	php7-cgi \
	php7-pear \
	rtorrent \
	screen \
	sox \
	unrar \
	zip && \
 echo "**** install rutorrent ****" && \
 mkdir -p /app/rutorrent \
	/defaults/rutorrent-conf && \
 curl -o \
 /tmp/rutorrent.tar.gz -L \
	"https://github.com/Novik/ruTorrent/archive/master.tar.gz" && \
 tar xf \
 /tmp/rutorrent.tar.gz -C \
	/app/rutorrent/ --strip-components=1 && \
 mv /app/rutorrent/conf/* \
	/defaults/rutorrent-conf/ && \
 rm -rf \
	/defaults/rutorrent-conf/users && \
 echo "**** patch snoopy.inc for rss fix ****" && \
 cd /app/rutorrent/php && \
 patch < /defaults/patches/snoopy.patch && \
 echo "**** cleanup ****" && \
 rm -rf \
	/etc/nginx/conf.d/default.conf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /downloads
