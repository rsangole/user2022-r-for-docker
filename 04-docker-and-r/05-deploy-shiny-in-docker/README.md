# Deploy Shiny App

This is an example of how we can deploy a shiny app in Docker. In this example, the needed packages as well as the Shiny app codebase is embeded in the image. No external volumes are mounted.

The `my_app/` folder holds a simple shiny app. This can be extended to a Shiny app of any complexity.

# Instructions

1. Open and read the `Dockerfile`. 
   1. Note that we're now using a different base image here - `rstudio/shiny`. This is an image already configured with the `{shiny}` package. While we could start with our previous `rocker/r-ver` or `rocker/rstudio` images, the build for `{shiny}` takes quite a while.
   2. We create a directory `/home/app` in the image, and copy over the needed files from `my_app/` into it
   3. Finally, run `shiny::runApp` to serve the app over port 3838
2. Execute `01-docker-build.sh` by running `./01-docker-build.sh` in your terminal. This will build a new image called `docker_for_r/shiny_deployment:v1.0`.
3. Once built, in your terminal:
   1. Run `docker run -p 3838:3838 docker_for_r/shiny_deployment:v1.0`. 
   2. _OR_ run `docker-compose up`.
   3. You should see outputs like:
```
R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"
...
...

> options(shiny.port = 3838, shiny.host = '0.0.0.0'); shiny::runApp('/home/app')
Loading required package: shiny

Listening on http://0.0.0.0:3838
```
4. Open your browser to http://0.0.0.0:3838 to interact with the app.
5. `control + C` to stop the container.