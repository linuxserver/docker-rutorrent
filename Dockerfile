FROM ghcr.io/linuxserver/baseimage-alpine-nginx:3.13

# set version label
ARG BUILD_DATE
ARG VERSION
ARG RUTORRENT_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

# copy patches
COPY patches/ /defaults/patches/

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	libffi-dev \
	openssl-dev \
	patch \
	py3-pip \
	python3-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
	bind-tools \
	curl \
	fcgi \
	ffmpeg \
	geoip \
	gzip \
	libffi \
	mediainfo \
	openssl \
	php7 \
	php7-cgi \
	php7-curl \
	php7-pear \
	php7-zip \
	procps \
	py3-requests \
	python3 \
	rtorrent \
	screen \
	sox \
	unrar \
	zip && \
 echo "**** install pip packages ****" && \
 pip3 install --no-cache-dir -U \
	cfscrape \
	cloudscraper && \
 echo "**** install rutorrent ****" && \
 if [ -z ${RUTORRENT_RELEASE+x} ]; then \
	RUTORRENT_RELEASE=$(curl -sX GET "https://api.github.com/repos/Novik/ruTorrent/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \
 curl -o \
 /tmp/rutorrent.tar.gz -L \
	"https://github.com/Novik/rutorrent/archive/${RUTORRENT_RELEASE}.tar.gz" && \
 mkdir -p \
	/app/rutorrent \
	/defaults/rutorrent-conf && \
 tar xf \
 /tmp/rutorrent.tar.gz -C \
	/app/rutorrent --strip-components=1 && \
 mv /app/rutorrent/conf/* \
	/defaults/rutorrent-conf/ && \
 rm -rf \
	/defaults/rutorrent-conf/users && \
 echo "**** patch snoopy.inc for rss fix ****" && \
 cd /app/rutorrent/php && \
 patch < /defaults/patches/snoopy.patch && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/etc/nginx/conf.d/default.conf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /downloads
