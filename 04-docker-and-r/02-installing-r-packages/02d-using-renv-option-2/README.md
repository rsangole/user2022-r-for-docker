‘/usr/local/lib/R/site-library'

# `renv` Install - Install packages when Docker image is built


# Instructions

1. Open and read the `Dockerfile`. Note how `renv` is installed first, and then the `renv.lock` file is copied to the image, and then the packages installed.
2. Review the `renv.lock` file. This defines which packages will be installed.
3. Read `01-docker-build.sh`. Build the docker image by `./01-docker-build.sh` in your terminal. This will build a new image called `docker_for_r/package_example_renv_1:v1.0`.
4. Read `02-check.sh`. Run it in your terminal using `./02-check.sh` to print the package versions.