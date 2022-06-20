## Setting up Docker


A good place to get started on Docker is their own documentation at [Orientation & Setup](https://docs.docker.com/get-started/).

## Quick Start Guide

- For Macs, download Docker Desktop [here](https://docs.docker.com/desktop/mac/install/).
- For Windows, download Docker Desktop [here](https://docs.docker.com/desktop/windows/install/).
- For Linux, download Docker Desktop [here](https://docs.docker.com/desktop/linux/install/).

Once installed, open a command prompt or bash window, and try running:

```sh
docker run -d -p 80:80 docker/getting-started sh; echo "Hello"
```

Docker should first download the image `docker/getting-started` and then run a container and print 'Hello' to the terminal.

```sh
(base) ~ ❯❯❯ docker run -d -p 80:80 docker/getting-started sh; echo "Hello"

38a2d6190e0ece38940d9d38f30e172b8e0569da63a6e3d8460d61c6472371f4
Hello
(base) ~ ❯❯❯
```

The alpha numeric printed is the container-id for the container spun up.

## Getting ready for the workshop

- Ensure Docker Desktop is installed and running using the instructions above
- Make a clone of this repository to your machine
- Download a few useful images listed below to save time during the workshop

```sh
docker pull rocker/r-ver:4.2.0
docker pull rocker/rstudio:4.2.0
docker pull rstudio/plumber
```

- Grab a cup of coffee