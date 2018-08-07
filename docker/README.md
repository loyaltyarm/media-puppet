># docker

This folder contains the Dockerfile I use to build test containers for live development iterations. It does some very basic commands to set up the container, and pulls in my user's ssh key so that I don't have to manually add ssh keys every time I build the container and attach for doing development. Each container is destroyed after development, and they are never committed. When the container is built, the masterless repo for media-puppet is pulled and applied to the container so that at development time, the container looks just like my plex media center.

TODO: add container build command with args
