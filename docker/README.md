># docker

This folder contains the Dockerfile I use to build test containers for live development iterations. It does some very basic commands to set up the container, and pulls in my user's ssh key so that I don't have to manually add ssh keys every time I build the container and attach for doing development. Each container is destroyed after development, and they are never committed. When the container is built, the masterless repo for media-puppet is pulled and applied to the container so that at development time, the container looks just like my plex media center. 

## Building the container
```
docker build --build-arg SSH_PRIVATE_KEY="$(cat /path/to/your/private.key)" --tag=testpuppet:latest docker
```

## Notes on the container
- assumes you have no password on your ssh key
- assumes you are okay passing your ssh key into the container (see above description)
- does not fully set up plexmediaserver just yet (at time of this update)
- temporarily does not apply puppet (at time of this update)
