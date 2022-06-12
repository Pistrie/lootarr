# Lootarr

The script in this repository will create a full pirac- I mean Linux ISO downloading setup, so you don't have to.

A lot of the script is based on bobarr, but tweaked so it works with my setup. I found that bobarr was not as intuitive as just using the normal containers, so I recreated his setup but using vanilla containers.

## What does this contain?

Currently, the script will setup 6 containers:
- gluetun       - A vpn container with automatic kill switch
- jackett       - API support for torrent trackers
- flaresolverr  - Proxy server to bypass Cloadflare protection
- qbittorrent   - BitTorrent client
- radarr        - Downloads movies using a torrent client like qbittorrent
- sonarr        - Downloads shows using a torrent client like qbittorrent

## Required software

- `docker` and `docker-compose` (I've tried making it compatible with `podman`, but no luck so far)

## Installation

- Clone or download the repository and place the project in a directory of your choice

### Configuration

- run `cp sample.env .env` and edit this `.env` file so it matches your needs
- open `docker-compose.yaml` and edit the configuration of `gluetun` ([gluetun documentation](https://github.com/qdm12/gluetun/wiki/)):
  - set `VPN_SERVICE_PROVIDER` to your provider
  - set `SERVER_REGIONS` to the location or locations of your choice
  - set `OPENVPN_USER` to your openvpn username
  - set `OPENVPN_PASSWORD` to your openvpn password
  - set `TZ` to your timezone, for example `Europe/Amsterdam`

#### Define the path of your movies and shows folders

- Open `docker-compose.yaml` and look for `/path/to/movies:/movies` and `/path/to/tvseries:/tv`
- Change the placeholder path to the left of `:` to the path where you want to save your media

For example, if I had:
```
/mnt/storage/
|- Movies/
|- Shows/
```

The lines should look like `/mnt/storage/Movies` and `/mnt/storage/Shows`

## Starting the containers

You can start the containers using:
- `lootarr.sh start`

## Stopping the containers

You can stop the containers using:
- `lootarr.sh stop`

## Updating the containers

You can update the containers using:
- `lootarr.sh update`
- `lootarr.sh start`

## Configuration

### Jackett

- Go to `http://<ip>:9117` and set flaresolverr url to `http://<ip>:8191` in the configuration
- Setup your trackers, then copy the API key on the top right of the screen

### Radarr/Sonarr

Radarr and Sonarr have a lot of options, not just when configuring, so I would recommend that you look around on the internet for some guidance on how to use these.

_A written guide will gladly be merged into this repo_

## Services

Here's a list of the services that you can use:
- jackett: `http://<ip>:9117`
- qbittorrent: `http://<ip>:8085`
- radarr: `http://<ip>:7878`
- sonarr: `http://<ip>:8989`
