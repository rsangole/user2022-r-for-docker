# Deploy Predictive Model

This is an example of how we can deploy a predictive model in Docker using the `{plumber}` API. A model file is embedded in the Docker image along with instructions (using `{plumber}`) on how the Docker container should handle requests to predict new data.

The `model/` folder holds the scripts for creation and execution model:

- `build-model.R` builds a simple linear regression model on the `mtcars` dataset. We're predicting `mpg ~ cyl + disp + hp`. The script then saves `lm_model.rds` to be used later. 
- `plumb-model.R` and `predict.R` are files to be used when the Docker container will be run

# Instructions

1. Open and read the `Dockerfile`. 
   1. Note that we're now using a different base image here - `rstudio/plumber`. This is an image already configured with the `{plumber}` package. While we could start with our previous `rocker/r-ver` or `rocker/rstudio` images, the build for `{plumber}` takes quite a while.
   2. We create a directory `/plumber/` in the image, and copy over the needed files from `model/` into it
   3. Finally, we source the `plumb-model.R` file which serves the API over the port 8000.
2. Execute `01-docker-build.sh` by running `./01-docker-build.sh` in your terminal. This will build a new image called `docker_for_r/model_deployment:v1.0`.
3. Once built, in your terminal, run `docker run -p 8000:8000 docker_for_r/model_deployment:v1.0`. You should see outputs like:
```
(base) ❯❯❯ docker run -p 8000:8000 docker_for_r/model_deployment:v1
Running plumb-model.R
Running plumber API at http://0.0.0.0:8000
Running swagger Docs at http://127.0.0.1:8000/__docs__/
```
4. Open your browser to http://127.0.0.1:8000/__docs__/. Try out the API using Swagger
5. Alternatively, try hitting the API in a new terminal window using a command like: `curl -X POST "http://127.0.0.1:8000/predict?cyl=4&disp=120&hp=120"`
   1. Try changing the values given to `cyl`, `disp` and `hp`.