# docker build, docker image ls

# Build an image from a Dockerfile.
# More information: <https://docs.docker.com/engine/reference/commandline/build/>.

# - Build a docker image using the Dockerfile in the current directory:
docker build .
docker image ls

# What do we see?
# How do we read the output?

# - Build a docker image and tag it:
#   Shortcut: docker build -t
#   Tag Schema: {namespace}/{image_name}:{tag}
# 		docker_for_r:v1.0
#		your_orgs_docker_hub.com/project_name/shiny_app:prod-v2.0.5
docker build --tag docker_for_r: .

# - Build a docker image using a specific Dockerfile:
docker build --file Dockerfile -t docker_for_r/simple:test.

# docker image
# Manage Docker images.

# - List local Docker images:
docker image ls

# - Delete unused local Docker images:
docker image prune

docker image ls | grep docker_for_r

docker image inspect docker_for_r/simple:test

# docker run
# Run a command in a new Docker container.

# - Run command in a new container from a tagged image:
#     docker run image:tag command
docker run docker_for_r/simple:test echo "Hello"

# - Run command in a one-off container in interactive mode and pseudo-TTY:
#     docker run --rm -it image command
docker run --rm -it docker_for_r/simple:test bash

# - Run command in a new container in background and display its ID:
#     docker run -d image command
docker run -d rocker/rstudio:4.2.0
docker ps
docker stop 193fb8a5c41b

# - Run command in a new container with passed environment variables:
#     docker run -e 'variable=value' -e variable image command
docker run -e 'NEW_VAR=3.14' --rm -it docker_for_r/simple:test bash

# - Run command in a new container with bind mounted volumes:
#     docker run -v path/to/host_path:path/to/container_path image command
docker run \
	--rm \
	-it \
	-v /Users/rahul/github/github.com/user2022-r-for-docker/03-docker-cli:/home/work/ \
	docker_for_r/simple:test \
	bash

# - Run command in a new container with published ports:
#     docker run -p host_port:container_port image command
docker run \
	-p 8787:8787 \
	-e PASSWORD=user2022 \
	rocker/rstudio:4.2.0

# docker ps
# List Docker containers.

# - List currently running docker containers:
docker ps

# - List all docker containers (running and stopped):
docker ps --all

# docker exec
# Execute a command on an already running Docker container.
docker run \
	-d \
	-p 8787:8787 \
	-e DISABLE_AUTH=true \
	-e FOO=bar \
	--name goblue \
	rocker/rstudio:4.2.0
docker ps
docker exec -it goblue bash
docker stop goblue

# docker compose
# Run and manage multi container docker applications.

# Create and start all containers using a `docker-compose.yml` file from the current directory:
docker-compose up

# - List all running containers:
docker-compose ps

# - Create and start all containers in the background using a `docker-compose.yml` file from the current directory:
docker-compose up -d

# - Stop all running containers:
docker-compose stop