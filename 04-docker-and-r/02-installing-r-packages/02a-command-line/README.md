# Command Line Install

This example shows you how to install R packages using a "command line" approach, which is typically how you install R packages in R today.

In the `Dockerfile`, you'll see two ways packages are installed:

1. using `install.packages` with `Rscript`
2. using a [littler](https://github.com/eddelbuettel/littler) script `install2.r

# Instructions

1. Open and read the `Dockerfile`
2. Read `01-docker-build.sh`. Build the docker image by `./01-docker-build.sh` in your terminal
3. Read `02-check.sh`. Run it in your terminal using `./02-check.sh` to print the package versions.