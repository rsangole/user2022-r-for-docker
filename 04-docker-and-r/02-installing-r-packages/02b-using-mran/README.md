# Command Line Install

This example shows you how to install R packages using the [MRAN](https://mran.microsoft.com) repository.

# Instructions

1. Open and read the `Dockerfile`
2. Read `01-docker-build.sh`. Build the docker image by `./01-docker-build.sh` in your terminal
3. Read `02-check.sh`. Run it in your terminal using `./02-check.sh` to print the package versions.

We're using an older `MRAN_BUILD_DATE` of '2021-01-01'. Compare the versions of `{cli}` and `{txtplot}` to what we saw in example `02a`.