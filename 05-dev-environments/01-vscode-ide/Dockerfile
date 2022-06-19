FROM rocker/r-ver:4.2.0

LABEL purpose="Example of setup for VS Code"

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    libxml2-dev \
    libfontconfig1-dev \
    && pip install -U radian

ENV RENV_VERSION 0.15.5
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /renv
COPY renv.lock renv.lock

RUN R -e "renv::restore()"
