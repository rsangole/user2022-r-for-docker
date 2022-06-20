FROM rocker/rstudio:4.2.0

LABEL purpose="Example of developing in RStudio IDE"

ENV MRAN_BUILD_DATE=2022-06-18

RUN install2.r \
	-r https://cran.microsoft.com/snapshot/${MRAN_BUILD_DATE} \
	--error \
	data.table

EXPOSE 8787