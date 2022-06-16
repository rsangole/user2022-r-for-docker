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

## Getting ready for the workshop

- Ensure Docker Desktop is installed and running using the instructions above
- Make a clone of this repository to your machine
- Pre-downloading a few useful images listed below
- Grab a cup of coffee

```sh
docker pull r-base:latest
docker pull rocker/rstudio:latest
```