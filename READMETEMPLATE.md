![https://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://www.linuxserver.io/) team brings you another quality container release 
featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our 
[forums](https://forum.linuxserver.io/index.php) or for real-time support our 
[IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/ruttorrent

Popular rtorrent client with a webui for ease of use. [Rutorrent](https://github.com/Novik/ruTorrent)

## Usage

```
docker create --name=ruttorent -v /etc/localtime:/etc/localtime:ro -v \
<path to data>:/config -v <path to downloads>:/downloads \
-e PGID=<gid> -e PUID=<uid> -p 80:80 -p 45566:45566 \
linuxserver/rutorrent
```

**Parameters**

* `-p 80` - the port(s)
* `-p 45566` - the port(s)
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - where rutorrent should store it's config files
* `-v /downloads` - path to your downloads folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do 
`docker exec -it rutorrent /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to 
the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and 
`PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an 
application is installed on the host OS it is normally added to the common group called users, Docker 
apps due to the nature of the technology can't be added to this group. So we added this feature to let 
you easily choose when running your containers.

## Setting up the application 

Webui can be found at `<your-ip>:80` , configuration files are in /config/rtorrent.

`** Important note for unraid users or those running a webserver on port 80, change port 80 assignment 
**`


## Updates

* Upgrade to the latest version simply `docker restart rutorrent`.
* To monitor the logs of the container in realtime `docker logs -f ruttorent`.



## Versions

+ **dd.MM.yyyy:** Intial Release. 

