
# `renv` Install - Install packages when Docker image is built


# Instructions

1. Open and read the `Dockerfile`. Note how `renv` is installed first, and then the `renv.lock` file is copied to the image, and then the packages installed.
2. Review the `renv.lock` file. This defines which packages will be installed.
3. Read `01-docker-build.sh`. Build the docker image by `./01-docker-build.sh` in your terminal. This will build a new image called `docker_for_r/package_example_renv_1:v1.0`.
4. Read `02-check.sh`. Run it in your terminal using `./02-check.sh` to print the package versions.
5. Let's peek into the docker image further. Run `docker run --rm -it docker_for_r/package_example_renv_1:v1.0 bash` to start a container & open a bash terminal.
6. Answer these questions:
   1. What's the current working directory? Why? 
   2. Can you find the `renv.lock` file?
   3. Where are the packages we installed using `renv::restore`? _Hint: Look under ‘/usr/local/lib/R/site-library'`