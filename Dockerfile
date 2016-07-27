FROM lsiobase/alpine
MAINTAINER sparklyballs

# package version
ARG MEDIAINF_VER="0.7.85"

# install packages
RUN \
 apk add --no-cache \
	--no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
	rutorrent && \

 apk add --no-cache \
	ca-certificates \
	curl \
	fcgi \
	ffmpeg \
	geoip \
	gzip \
	lighttpd \
	php5-cgi \
	php5-json \
	php5-pear \
	rtorrent \
	screen \
	tar \
	unrar \
	unzip \
	zip

# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	autoconf \
	automake \
	cppunit-dev \
	curl-dev \
	file \
	g++ \
	gcc \
	libtool \
	make \
	ncurses-dev \
	openssl-dev && \

# fetch and unpack source
 curl -o \
 /tmp/libmediainfo.tar.gz -L \
	"http://mediaarea.net/download/binary/libmediainfo0/${MEDIAINF_VER}/MediaInfo_DLL_${MEDIAINF_VER}_GNU_FromSource.tar.gz" && \
 curl -o \
 /tmp/mediainfo.tar.gz -L \
	"http://mediaarea.net/download/binary/mediainfo/${MEDIAINF_VER}/MediaInfo_CLI_${MEDIAINF_VER}_GNU_FromSource.tar.gz" && \

 mkdir -p \
	/tmp/libmediainfo \
	/tmp/mediainfo && \
 tar xf /tmp/libmediainfo.tar.gz -C \
	/tmp/libmediainfo --strip-components=1 && \
 tar xf /tmp/mediainfo.tar.gz -C \
	/tmp/mediainfo --strip-components=1 && \

# compile mediainfo packages
 cd /tmp/libmediainfo && \
	./SO_Compile.sh && \
 cd /tmp/libmediainfo/ZenLib/Project/GNU/Library && \
	make install && \
 cd /tmp/libmediainfo/MediaInfoLib/Project/GNU/Library && \
	make install && \
 cd /tmp/mediainfo && \
	./CLI_Compile.sh && \
 cd /tmp/mediainfo/MediaInfo/Project/GNU/CLI && \
	make install && \

# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80 5000 51413 6881
VOLUME /config /downloads
