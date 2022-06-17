FROM rocker/r-ver:4.2.0

LABEL purpose="Example of using MRAN repo"

ENV MRAN_BUILD_DATE=2021-01-01

# Example of a conventional `install.packages()` approach 
RUN Rscript -e "install.packages('cli', repos = 'https://cran.microsoft.com/snapshot/${MRAN_BUILD_DATE}')"

# Example of `install2.r`
RUN install2.r \
	-r https://cran.microsoft.com/snapshot/${MRAN_BUILD_DATE} \
	--error \
	txtplot