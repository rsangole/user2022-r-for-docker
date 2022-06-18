FROM rocker/r-ver:4.2.0

LABEL purpose="Example of {renv}: Install packages when Docker image is built."

ENV RENV_VERSION 0.15.5
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

RUN mkdir -p /renv/cache

WORKDIR /home/work