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



