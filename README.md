# Lootarr

The script in this repository will create a full pirac- I mean Linux ISO downloading setup, so you don't have to.

A lot of the script is based on bobarr, but tweaked so it works with my setup. I found that bobarr was not as intuitive as just using the normal containers, so I recreated his setup but instead only using vanilla containers.

## What does this contain?

Currently, the script will set up 6 containers:
- gluetun       - A vpn container with automatic kill switch
- prowlarr      - API support for torrent trackers
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
  - set `VPN_TYPE` to either openvpn or wireguard
  - set the remaining environment variables to your needs, for example the regions you want to use (check the gluetun documentation)

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

Take a look at the prowlarr quickstart guide for instructions on how to set up prowlarr, sonarr, and radarr -> https://wiki.servarr.com/prowlarr/quick-start-guide

## Services

Here's a list of the services that you can use:
- prowlarr: `http://<ip>:9696`
- qbittorrent: `http://<ip>:8085`
- radarr: `http://<ip>:7878`
- sonarr: `http://<ip>:8989`
