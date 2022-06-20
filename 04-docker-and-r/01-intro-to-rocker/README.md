# The Rocker project

**What is it?**

This Rocker Project has a list of easy to use Docker images for various needs for R developers. 

**Why use it?**

1. The fastest way for new R users to get up & running in Docker
2. Plethora of Docker images to choose from for your usecase: Just R, R with RStudio, Images for Shiny, Images for Machine Learning, Images with GPU support
3. Well maintained version-tagged repository for a large number of R versions that _just work_

**Where can I learn more?**

- [List of Images](https://www.rocker-project.org/images/)
- [The Rocker Project](https://www.rocker-project.org/)

---

# An Example

Let's try out a basic image from the Rocker project. Let's pull a basic simple image containing R version 4.2.0.

First, pull the image.

```sh
docker pull rocker/r-ver:4.2.0
```

Second, read the *Dockerfile* [here](https://hub.docker.com/layers/r-ver/rocker/r-ver/4.2.0/images/sha256-a5cff75569e3fdae2ce1aa87516494801ba35b022c4adaeb2a33d1ee80319697?context=explore).

Now, try running R with the image. Recall, the command follows the structure `docker run {arguments} {docker-image-name} {command-to-execute}`. 

```sh
docker run -it --rm rocker/r-ver:4.2.0 R
```

This should open a working R terminal in an interactive (`-it`) one-off container (`--rm`).

To finish, use `q()`, which will exit the R terminal and close the active container.