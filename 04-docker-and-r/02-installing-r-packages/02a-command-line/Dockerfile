FROM rocker/r-ver:4.2.0

LABEL purpose="Simple example for a standard R package install or usage of install2.r"

# Example of a conventional `install.packages()` approach 
RUN Rscript -e "install.packages('cli')"

# Example of `install2.r`
RUN install2.r \
	--error \
	txtplot