# Installing R Packages

There are a couple of ways we can install R packages in a Docker image, each with their pros and cons. Let's explore all of them in this section.

Method              | Details                                                                                                                              | Pros                                                                                                                | Cons
--------------------|--------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------
`install2.r`        | Install R packages using a [littler](https://github.com/eddelbuettel/littler/blob/master/inst/examples/install2.r) script from CRAN. | <ul><li>Easy to usein `RUN` commands. </li><li>Well [documented](https://eddelbuettel.github.io/littler/)</li></ul> | <ul><li>Requires `{littler}` pre-installed. </li><li>Default CRAN repo does not ensure full reproducibility.</li></ul>
MRAN                | Install R packages from [MRAN repository](https://mran.microsoft.com). |<ul><li>MRAN date-lock ensure full reproducibility at any time in the future</li><li>No dependencies on other R packages</li></ul>| <ul><li>Depend on Microsoft keeping MRAN alive</li><li>Can't lock down specific versions of R package</li></ul>
`{renv}` Approach 1 | Use [`{renv}`](https://rstudio.github.io/renv/index.html). Install packages in container. | <ul><li>Easy to use project-local R dependency management tool</li><li>Ensures full reproduciblity - can lock package versions</li><li>Human readable `renv.lock` file</li></ul>  | <ul><li></li><li></li></ul>
`{renv}` Approach 2 | Use [`{renv}`](https://rstudio.github.io/renv/index.html). Mount packages from local volume. | <ul><li></li><li></li></ul> | <ul><li></li><li></li></ul>


[1] Useful reading for `{renv}` with Docker - [link](https://rstudio.github.io/renv/articles/docker.html)