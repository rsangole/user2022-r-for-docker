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
#1 sha256:d4b9d3e621a5bc9651436029854a9a14941d1e10b2f25e2c4efd744d6aa9a0dc
#1 transferring dockerfile: 37B done
#1 DONE 0.0s

#2 [internal] load .dockerignore
#2 sha256:97003bfaa735ac1b9470c27123753eabdbdd0a6dfcd959c23e02c56e40958dba
#2 transferring context: 2B done
#2 DONE 0.0s

#3 [internal] load metadata for docker.io/rocker/r-ver:4.2.0
#3 sha256:266598a71b086c88f019f9187a5aaf6a74b2f977672d5ce8e758812d17a390ed
#3 DONE 2.0s

#4 [1/4] FROM docker.io/rocker/r-ver:4.2.0@sha256:f32b3e9e353fa63092093f2ce590d819f56eac92f6f79e97906d4f2b0eee5ef3
#4 sha256:b1078d2e76fd8b401815fcff9401dd53403e2d2b839fd517e253a83020bf4938
#4 CACHED

#6 [internal] load build context
#6 sha256:b33a9a9621d92c268a5f993db3300ab0585be9cc8ce262e6c6a8532ff54f36fd
#6 transferring context: 38B done
#6 DONE 0.0s

#5 [2/4] RUN mkdir scripts
#5 sha256:42381d19d2196949ad566901d4d965b68fad42302db7e498b24e12075880e366
#5 DONE 0.9s

#7 [3/4] COPY *.R scripts/
#7 sha256:d910e253fed5a46d8cd1953d49f04d067dac0f10930829a21463e8895f3bd41f
#7 DONE 0.0s

#8 [4/4] RUN Rscript scripts/Hello_useR!2022.R
#8 sha256:50b90ed2e01a57d96236779ccf486e863a1b02e9a174ffa4cdea8d66a560bfb6
#8 0.636 [1] "Welcome to the useR!2022 Conference!!!"
#8 0.636 [1] "Welcome to the Docker for R Users Workshop!!!"
#8 DONE 0.7s

#9 exporting to image
#9 sha256:e8c613e07b0b7ff33893b694f7759a10d42e180f2b4dc349fb57dc6b71dcab00
#9 exporting layers 0.0s done
#9 writing image sha256:4b91ffed7e78fb18e38a88f723a20501382a7ecfeafbb2409478562d4fc32e80 done
#9 naming to docker.io/library/user2022:hello.world done
#9 DONE 0.1s
```

Let's now go step by step to understand the functionality of each one of the `Dockerfile` commands and map it with the outputs:

- `FROM` - Defines the base image to use for the build of the following stages.  A valid docker will always start with FROM instruction. In the case above, we imported the `rocker/r-ver:4.2.0` image - a Linux OS with R version 4.2.0 installed. You can see in the output that steps 3 and 4 releated to the import process of the `rocker` image.
- `LABEL` - Enables to add information about the image to the image's metadata, such as authors, maintainers, license, etc. In this case we defined four labels - `maintainer`, `info`, `code`, and `license`.
- `ARG` - Defines variables that can be passed to the image during the build time. This variable will be available only during the build time as an environment variable. While we define in the example above a default value for the message1 variable, we can modify it during the build time using the `build-arg` argument.
- `ENV` - Sets the image environment variables. Those variables are kept on the image metadata and can be used during the run time as well.
- `RUN` - Enables to execute of CLI commands on the image during the image build time. 
- `COPY` - Enables copying files from the local system to the image during the image build time


Other common commands:
- `EXPOSE` - Defines the port on the container to listen during run time.
- `CMD` - Enables the execution of commands during the run time (unlike RUN, which executes during the build time).
- `ENDRYPOINT` - Enables the execution of commands during the run time with arguments.
- `VOLUME` - Sets a mount point inside the image which can be linked with external volume (e.g., local directory).
- `WORKDIR` - Defines the working directory inside the image for any RUN, CMD, ENTRYPOINT, COPY, and ADD commands

Reference - https://docs.docker.com/reference/
