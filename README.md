![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring auto-update on startup, easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/rutorrent

Popular rtorrent client with a webui for ease of use. [Rutorrent](https://github.com/Novik/ruTorrent)

## Usage

```
docker create --name=ruttorent \
-v <path to data>:/config \
-v <path to downloads>:/downloads \
-e PGID=<gid> -e PUID=<uid> -e TZ=<timezone> \
-p 80:80 -p 9527:9527/udp -p 45566-45576:45566-45576 \
linuxserver/rutorrent
```

**Parameters**

* `-p 80` - the port(s)
* `-p 45566-45576` - the port(s)
* `-p 9527/udp` - the port(s)
* `-v /config` - where rutorrent should store it's config files
* `-v /downloads` - path to your downloads folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

Webui can be found at `<your-ip>:80` , configuration files are in /config/rtorrent.

`** Important note for unraid users or those running a webserver on port 80, change port 80 assignment 
**`


## Updates

* Shell access whilst the container is running: `docker exec -it rutorrent /bin/bash`
* Upgrade to the latest version: `docker restart rutorrent`
* To monitor the logs of the container in realtime: `docker logs -f rutorrent`



## Versions

+ **08.03.2016:** Intial Release. 

