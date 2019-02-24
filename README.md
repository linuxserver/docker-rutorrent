[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/rutorrent](https://github.com/linuxserver/docker-rutorrent)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/rutorrent.svg)](https://microbadger.com/images/linuxserver/rutorrent "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/rutorrent.svg)](https://microbadger.com/images/linuxserver/rutorrent "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/rutorrent.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/rutorrent.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-rutorrent/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-rutorrent/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/rutorrent/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/rutorrent/latest/index.html)

[Rutorrent](https://github.com/Novik/ruTorrent) is a popular rtorrent client with a webui for ease of use.

[![rutorrent](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/rutorrent.jpg)](https://github.com/Novik/ruTorrent)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/rutorrent` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=rutorrent \
  -e PUID=1001 \
  -e PGID=1001 \
  -p 80:80 \
  -p 5000:5000 \
  -p 51413:51413 \
  -p 6881:6881/udp \
  -v </path/to/rutorrent/config>:/config \
  -v </path/to/rutorrent/downloads>:/downloads \
  --restart unless-stopped \
  linuxserver/rutorrent
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  rutorrent:
    image: linuxserver/rutorrent
    container_name: rutorrent
    environment:
      - PUID=1001
      - PGID=1001
    volumes:
      - </path/to/rutorrent/config>:/config
      - </path/to/rutorrent/downloads>:/downloads
    ports:
      - 80:80
      - 5000:5000
      - 51413:51413
      - 6881:6881/udp
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 80` | ruTorrent Web UI |
| `-p 5000` | scgi port |
| `-p 51413` | Bit-torrent port |
| `-p 6881/udp` | Bit-torrent port |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-v /config` | where ruTorrent should store it's config files |
| `-v /downloads` | path to your downloads folder |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```


&nbsp;
## Application Setup

Webui can be found at `<your-ip>:80` , configuration files for rtorrent are in /config/rtorrent, php in config/php and for the webui in /config/rutorrent/settings.

`Settings, changed by the user through the "Settings" panel in ruTorrent, are valid until rtorrent restart. After which all settings will be set according to the rtorrent config file (/config/rtorrent/rtorrent.rc),this is a limitation of the actual apps themselves.`

** Important note for unraid users or those running services such as a webserver on port 80, change port 80 assignment **

`** It should also be noted that this container when run will create subfolders ,completed, incoming and watched in the /downloads volume.**`

** The Port Assignments and configuration folder structure has been changed from the previous ubuntu based versions of this container and we recommend a clean install **

Umask can be set in the /config/rtorrent/rtorrent.rc file by changing value in `system.umask.set`

If you are seeing this error `Caught internal_error: 'DhtRouter::get_tracker did not actually insert tracker.'.` , a possible fix is to disable dht in `/config/rtorrent/rtorrent.rc` by changing the following values.

```shell
dht = disable
peer_exchange = no
```

If after updating you see an error about connecting to rtorrent in the webui,
remove or comment out these lines in /config/rtorrent/rtorrent.rc ,whatever value is set, yes or no.
Just setting them to no will still cause the error..

```
use_udp_trackers = yes
peer_exchange = yes
```



## Support Info

* Shell access whilst the container is running: `docker exec -it rutorrent /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f rutorrent`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' rutorrent`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/rutorrent`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/rutorrent`
* Stop the running container: `docker stop rutorrent`
* Delete the container: `docker rm rutorrent`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start rutorrent`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update the image: `docker-compose pull linuxserver/rutorrent`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **22.02.19:** - Rebasing to alpine 3.9.
* **03.11.18:** - Add pipeline and multi arch logic to repo.
* **27.08.18:** - Add bind tools package.
* **22.08.18:** - Rebase to alpine 3.8.
* **08.12.17:** - Rebase to alpine 3.7, add sox package.
* **28.10.17:** - Mediainfo moved from testing to community repo.
* **09.10.17:** - Use repo version of mediainfo to shorten build time.
* **28.05.17:** - Fix permissions on secondary temp folder of nginx.
* **26.05.17:** - Rebase to alpine 3.6.
* **03.05.17:** - Fix log permissions.
* **18.03.17:** - Note in readme about disabling dht in some circumstances.
* **24.02.17:** - Patch a source file to quash rss https bug.
* **29.01.17:** - Rebase to alpine 3.5.
* **20.11.16:** - Add php7-mbstring package, bump mediainfo to 0.7.90.
* **14.10.16:** - Add version layer information.
* **04.10.16:** - Remove redundant sessions folder.
* **30.09.16:** - Fix umask.
* **21.09.16:** - Bump mediainfo, reorg dockerfile, add full wget package.
* **09.09.16:** - Add layer badges to README.
* **28.08.16:** - Add badges to README, bump mediainfo version to 0.7.87.
* **07.08.16:** - Perms fix on nginx tmp folder, also exposed php.ini for editing by use in /config/php.
* **26.07.16:** - Rebase to alpine.
* **08.03.16:** - Initial Release.
