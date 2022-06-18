‘/usr/local/lib/R/site-library'

# `renv` Install - Install packages when Docker container is run

This approach uses a local shared cache can highly speed up the Docker build process across all Docker builds. This tutorial is a bit more involved and requires more orchestration than the others.

The `project_folder` should be thought of as your project's working folder. This would be where you save your project scripts in a real world project. The `renv-cache` folder will simulate a location on disk where the common `renv` cache will be stored.

# Instructions

1. Open and read the `Dockerfile`. Note how we do _not_ use `renv::restore` in this image. We _do not_ install the packages within the Docker image.
2. Read `project_folder/docker/docker-build.sh`.
   1. In your terminal, change directories to `docker` using `cd project_folder/docker`.
   2. Build the docker image by `./01-docker-build.sh`. 
   3. This will build a new image called `docker_for_r/package_example_renv_2:v1.0`.
3. Open `run-docker.sh` in your local editor. 
   1. You need to set two paths customized to your machine.
      1. Set `YOUR_LOCAL_RENV_CACHE_PATH` to where `renv-cache` resides
      2. Set `YOUR_LOCAL_PROJECT_FOLDER` to where `project_folder` resides
   2. The `docker run` command will mount two volumes to your container:
      1. `YOUR_LOCAL_RENV_CACHE_PATH` will mount to `/renv/cache`
      2. `YOUR_LOCAL_PROJECT_FOLDER` will mount to `/home/work`
4. Review the project_folder/.Renviron` file. Notice that we set an environment variable which tells `{renv}` where it should find the package cache.
5. In your terminal, change into `project_folder/` and run the script using `./run-docker.sh`. 
   1. This will start a new container, open bash into the `/home/work` directory
   2. Confirm using `pwd`
   3. Run `ls` to see that the directory contents are now exposed to the container
   4. Run `ls /renv/cache/`. It'll be empty right now.
6. Run `R`.
   1. Confirm the renv cache location using: `Sys.getenv('RENV_PATHS_CACHE')`
   2. Run `renv::init()` to initialize the project. `{renv}` will check the project folder, find all packages being used and create a `renv.lock` file with the packages. Since `script.R` references `data.table`, it'll be used in the `renv.lock` file, as well as installed in our cache location. Let's confirm this.
   3. Run `q()` to exit R.
   4. Run `ls /renv/cache/v5/R-4.2/x86_64-pc-linux-gnu/`. You'll see `data.table` present.
   5. Since this folder is actually mounted from your local machine, let's confirm it outside the docker container. Open `Finder` or `Explorer`, head to the cache folder and confirm this for yourself.
   6. Open `R` in your container again. Try installing a new package `renv::install("cli")`.
   7. Peek into the renv cache folder again. What do you see?