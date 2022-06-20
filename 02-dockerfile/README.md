### Dockerfile

The [Dockerfile](https://docs.docker.com/engine/reference/builder/) is the image manifest. It enables the user to define the image "recipe" by using a list of instructions for the **Docker engine**. The Docker engine uses those instructions to execute during the build time of the image. That includes leveraging other images, running commands lines operation to install requirements and dependencies, copying files and scripts from the local machine to the image, etc.

In the following example, we will use the Dockerfile to import an image with a preset R 4.2.0 environment and run an R script `Hello_useR!2022.R` that displays two environment variables: 

`Dockerfile`
``` Dockerfile
# See dockerfile commands reference: https://docs.docker.com/engine/reference/builder/
FROM rocker/r-ver:4.2.0

LABEL maintainer="Your Name <your_email@something.com>" \
      info="useR!2022 Conference Docker for R Users Workshop" \
      code="https://github.com/rsangole/user2022-r-for-docker" \
      license="MIT"

ARG message1="Welcome to the useR!2022 Conference!!!"

ENV message2="Welcome to the Docker for R Users Workshop!!!"

RUN mkdir scripts

COPY *.R scripts/

RUN Rscript scripts/Hello_useR!2022.R

```

The `Dockerfile` will copy the following R script and execute it during the build time of the Docker image.

`Hello_useR!2022.R`
``` R
print(Sys.getenv("message1"))
print(Sys.getenv("message2"))
```

Before diving into the Dockerfile commands, let's use the `build` command to build the image and inspect its output:

``` shell
docker build . --progress=plain -t user2022:hello.world
```

**Note:** Don't worry if you are not familiar with the Docker CLI commands. This will be covered in detail in the following sections. In the example above, we used the `progress` and `t` arguments to customize the build output and set the image name and tag as `user2022:hello.world`, respectively.

You should expect the following output:
``` shell
#1 [internal] load build definition from Dockerfile
#1 sha256:24104c834439f161df24f4ec870b5356860a90774f43f5b3feb7f24aaf1bd190
#1 transferring dockerfile: 37B 0.0s done
#1 DONE 0.0s

#2 [internal] load .dockerignore
#2 sha256:1560cc336425ec48cc4efc65f64ea60f817130208c76e999977761eb4764ec50
#2 transferring context: 2B done
#2 DONE 0.0s

#3 [internal] load metadata for docker.io/rocker/r-ver:4.2.0
#3 sha256:266598a71b086c88f019f9187a5aaf6a74b2f977672d5ce8e758812d17a390ed
#3 DONE 2.5s

#4 [1/4] FROM docker.io/rocker/r-ver:4.2.0@sha256:f32b3e9e353fa63092093f2ce590d819f56eac92f6f79e97906d4f2b0eee5ef3
#4 sha256:b1078d2e76fd8b401815fcff9401dd53403e2d2b839fd517e253a83020bf4938
#4 DONE 0.0s

#6 [internal] load build context
#6 sha256:2072b68a376552534cad1a9ca2d427555bc98ac5b3567b69bc38b6dfc8050fe8
#6 transferring context: 38B done
#6 DONE 0.0s

#5 [2/4] RUN mkdir scripts
#5 sha256:42381d19d2196949ad566901d4d965b68fad42302db7e498b24e12075880e366
#5 CACHED

#7 [3/4] COPY *.R scripts/
#7 sha256:01842234fa2ed700b573447eb229286054e8bf09258579064d5323d0534d0800
#7 CACHED

#8 [4/4] RUN Rscript scripts/Hello_useR!2022.R
#8 sha256:5fcf3902060151e3dee1340f408d2f48bd94d0fe57e21aac9ffbd2250b07f75b
#8 CACHED

#9 exporting to image
#9 sha256:e8c613e07b0b7ff33893b694f7759a10d42e180f2b4dc349fb57dc6b71dcab00
#9 exporting layers done
#9 writing image sha256:48f5586c2eda7f0862ccc495e2c0462756d6a149868c71f2ff51f72b8db5d98c done
#9 naming to docker.io/library/user2022:hello.world done
#9 DONE 0.0s
```

Let's now go step by step to understand the functionality of each one of the `Dockerfile` commands and map it with the outputs:

- `FROM` - Defines the base image to use for the build of the following stages.  A valid docker will always start with FROM instruction. In the case above, we imported the `rocker/r-ver:4.2.0` image - a Linux OS with R version 4.2.0 installed. You can see in the output that steps 3 and 4 releated to the import process of the `rocker` image.
- `LABEL` - Enables to add information about the image to the image's metadata, such as authors, maintainers, license, etc. In this case we defined four labels - `maintainer`, `info`, `code`, and `license`.
- `ARG` - Defines variables that can be passed to the image during the build time
- `ENV` - Sets the image environment variables




* LABEL - Enables to add information about the image to the image’s metadata, such as authors, maintainers, license, etc
* RUN - Enables to execute commend lines commands during the image build time 
* COPY - Enables to copy files from your local system to the image
- EXPOSE - Defines the port on the container to listen during run time.
- CMD - Enables to run commands during the run time (unlike RUN which run during the build time).
- ENDRYPOINT - Enables to run commands during the run time with arguments.
- VOLUME - Sets the a mount point inside the image which can be linked with external volume (e.g., local directory).
- WORKDIR - Defines the work directory inside the image for any RUN, CMD, ENTRYPOINT, COPY, and ADD commands

Reference - https://docs.docker.com/reference/
