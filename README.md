![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/rutorrent
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/rutorrent.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/rutorrent.svg)][hub]
[![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io/linuxserver-rutorrent)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io/job/linuxserver-rutorrent/)
[hub]: https://hub.docker.com/r/linuxserver/rutorrent/

Popular rtorrent client with a webui for ease of use. [Rutorrent](https://github.com/Novik/ruTorrent)

[![rutorrent](https://danthesalmon.com/blog/wp-content/uploads/2015/12/rutorrent.jpg)][rutorrenturl]
[rutorrenturl]: https://github.com/Novik/ruTorrent

## Usage

```
docker create --name=ruttorent \
-v <path to data>:/config \
-v <path to downloads>:/downloads \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 80:80 -p 5000:5000 \
-p 51413:51413 -p 6881:6881/udp \
linuxserver/rutorrent
```

**Parameters**

* `-p 80` - the port(s)
* `-p 5000` - the port(s)
* `-p 51413` - the port(s)
* `-p 6881/udp` - the port(s)
* `-v /config` - where rutorrent should store it's config files
* `-v /downloads` - path to your downloads folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it rutorrent /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

Webui can be found at `<your-ip>:80` , configuration files for rtorrent are in /config/rtorrent, php in config/php and for the webui in /config/rutorrent/settings.

`Settings, changed by the user through the "Settings" panel in ruTorrent, are valid until rtorrent restart. After which all settings will be set according to the rtorrent config file (/config/rtorrent/rtorrent.rc),this is a limitation of the actual apps themselves.`

** Important note for unraid users or those running services such as a webserver on port 80, change port 80 assignment **

`** It should also be noted that this container when run will create subfolders ,completed, incoming, sessions and watched in the /downloads volume.**`

** The Port Assignments and configuration folder structure has been changed from the previous ubuntu based 
versions of this container and we recommend a clean install **


## Info

* Shell access whilst the container is running: `docker exec -it rutorrent /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f rutorrent`

## Versions

+ **28.08.16:** Add badges to README.
+ **07.08.16:** Perms fix on nginx tmp folder, also exposed php.ini for editing by user
in /config/php.
+ **26.07.16:** Rebase to alpine.
+ **08.03.16:** Intial Release.

