[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?style=flat-square&color=E68523&label=Discord&logo=discord&logoColor=FFFFFF)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?style=flat-square&color=E68523&logo=discourse&logoColor=FFFFFF)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?style=flat-square&color=E68523&label=Supporters&logo=open%20collective&logoColor=FFFFFF)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/rutorrent](https://github.com/linuxserver/docker-rutorrent)

[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-rutorrent.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-rutorrent)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-rutorrent.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-rutorrent/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub%20Package&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-rutorrent/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab&logoColor=FFFFFF)](https://gitlab.com/Linuxserver.io/docker-rutorrent/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/rutorrent)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/rutorrent.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/rutorrent "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/rutorrent.svg?style=flat-square&color=E68523&label=pulls&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/rutorrent)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/rutorrent.svg?style=flat-square&color=E68523&label=stars&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/rutorrent)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-rutorrent/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-rutorrent/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/rutorrent/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/rutorrent/latest/index.html)

[Rutorrent](https://github.com/Novik/ruTorrent) is a popular rtorrent client with a webui for ease of use.

[![rutorrent](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/rutorrent.jpg)](https://github.com/Novik/ruTorrent)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/rutorrent` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=rutorrent \
  -e PUID=1000 \
  -e PGID=1000 \
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
      - PUID=1000
      - PGID=1000
    volumes:
      - </path/to/rutorrent/config>:/config
      - </path/to/rutorrent/downloads>:/downloads
    ports:
      - 80:80
      - 5000:5000
      - 51413:51413
      - 6881:6881/udp
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
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-v /config` | where ruTorrent should store it's config files |
| `-v /downloads` | path to your downloads folder |

## Environment variables from files (Docker secrets)

You can set any environment variable from a file by using a special prepend `FILE__`. 

As an example:

```
-e FILE__PASSWORD=/run/secrets/mysecretpassword
```

Will set the environment variable `PASSWORD` based on the contents of the `/run/secrets/mysecretpassword` file.

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
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
protocol.pex.set = 0
```

If after updating you see an error about connecting to rtorrent in the webui,
remove or comment out these lines in /config/rtorrent/rtorrent.rc ,whatever value is set, yes or no.
Just setting them to no will still cause the error..

```
use_udp_trackers = yes
peer_exchange = yes
```

To add themes, create a themes folder in your /config directory and add your theme folders. Ensure proper user and group ownership is set once you add the directories.



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
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull rutorrent`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d rutorrent`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once rutorrent
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-rutorrent.git
cd docker-rutorrent
docker build \
  --no-cache \
  --pull \
  -t linuxserver/rutorrent:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **28.06.19:** - Rebasing to alpine 3.10.
* **20.05.19:** - Shift to building from official releases instead of commits.
* **13.05.19:** - Add libffi and openssl.
* **07.05.19:** - Add cloudscraper pip package.
* **11.04.19:** - Fix warnings in webui by adding python3, procps and pip packages.
* **23.03.19:** - Switching to new Base images, shift to arm32v7 tag.
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
