# Develop in RStudio IDE

This is an example of how to use the RStudio IDE in a Docker container to develop your project.

# Instructions

1. Open and read the `Dockerfile`. 
   1. Note that we're now using a different base image from before.
   2. `rocker/rstudio:4.2.0` is a base image which has RStudio pre-installed, perfect to quickly get started.
2. Read and execute `01-docker-build.sh` by running `./01-docker-build.sh` in your terminal.
   2. This will build a new image called `docker_for_r/rstudio:v1.0`.
3. Open `02-run-docker.sh` in your local editor. 
   1. You need to set one path customized to your machine.
      1. Set `YOUR_LOCAL_PROJECT_FOLDER` to where this folder resides.
   2. The `docker run` command will mount the volume to your container, along with setting a few more settings:
      1. `YOUR_LOCAL_PROJECT_FOLDER` will mount to `/home/rstudio` which is the default working folder for RStudio IDE.
      2. `-p 8787:8787` maps an 8787 port from within the container to 8787 on your local machine. This is where RStudio will serve itself to us.
      3. `-e DISABLE_AUTH="true"` avoids a login screen. If absent, a unique password will be offered to you in the terminal which you'll have to enter manually.
4. In your terminal, run the script using `./02-run-docker.sh`. 
   1. You'll see some verbiage on the terminal which will end with a line like `[services.d] done.`
5. Open your browser to http://localhost:8787
   1. You should see the contents of `$YOUR_LOCAL_PROJECT_FOLDER`
   2. Click and open the `useR_2022` R Project as you'd normally do
   3. Execute the contents of `test.R`. A CSV file will be written back into the folder.
   4. Confirm you're able to access the CSV file from outside the container using Finder or File Explorer.
6. Once you're done, you can stop the container by `control+c` in the terminal window. 