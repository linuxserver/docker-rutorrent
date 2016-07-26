FROM lsiobase/alpine
MAINTAINER sparklyballs

# package version
ARG MEDIAINF_VER="0.7.85"

# environment settings
ARG MEDIAINF_URL="http://mediaarea.net/download/binary"
ARG MEDIAINF_WWW="${MEDIAINF_URL}/mediainfo/${MEDIAINF_VER}/MediaInfo_CLI_${MEDIAINF_VER}_GNU_FromSource.tar.gz"
ARG MEDIAINF_LIB_WWW="${MEDIAINF_URL}/libmediainfo0/${MEDIAINF_VER}/MediaInfo_DLL_${MEDIAINF_VER}_GNU_FromSource.tar.gz"
ARG MEDIAINF_ROOT="/tmp"
ARG MEDIAINF_SRC="${MEDIAINF_ROOT}/mediainfo"
ARG MEDIAINF_LIB_SRC="${MEDIAINF_ROOT}/libmediainfo"

# install packages
RUN \
 apk add --no-cache \
	ca-certificates \
	curl \
	dtach \
	ffmpeg \
	geoip \
	git \
	gzip \
	nginx \
	rtorrent \
	tar \
	unrar \
	unzip \
	zip && \

 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/testing \
	php7 \
	php7-fpm \
	php7-json

# install build packages
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

# fetch source
 mkdir -p \
	"${MEDIAINF_LIB_SRC}" \
	"${MEDIAINF_SRC}" && \
curl -o \
 "${MEDIAINF_ROOT}/libmediainfo.tar.gz" -L \
	"${MEDIAINF_LIB_WWW}" && \
curl -o \
 "${MEDIAINF_ROOT}/mediainfo.tar.gz" -L \
	"${MEDIAINF_WWW}" && \

# unpack source and compile packages
 tar xf "${MEDIAINF_ROOT}/libmediainfo.tar.gz" -C \
	"${MEDIAINF_LIB_SRC}" --strip-components=1 && \
 tar xf "${MEDIAINF_ROOT}/mediainfo.tar.gz" -C \
	"${MEDIAINF_SRC}" --strip-components=1 && \
 cd "${MEDIAINF_LIB_SRC}" && \
	./SO_Compile.sh && \
 cd "${MEDIAINF_LIB_SRC}/ZenLib/Project/GNU/Library" && \
	make install && \
 cd "${MEDIAINF_LIB_SRC}/MediaInfoLib/Project/GNU/Library" && \
	make install && \
 cd "${MEDIAINF_SRC}" && \
	./CLI_Compile.sh && \
 cd "${MEDIAINF_SRC}/MediaInfo/Project/GNU/CLI" && \
	make install && \

# cleanup
apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 5000 6881 51413
VOLUME /config /downloads
