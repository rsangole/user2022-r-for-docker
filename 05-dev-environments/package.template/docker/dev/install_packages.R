# Installing R packages inside docker
# Setting ----
cran_mirror <- "https://cran.rstudio.com/"
quiet <- FALSE # Set TRUE for clean output, when testing or getting errors use FALSE

# Set packages and their version (optional)
pkg_list <- data.frame(package = c("knitr", "ggplot", "rmarkdown", "testthat"),
                       version = c(NA, NA, NA, NA), 
                       stringsAsFactors = FALSE)
                
pkg_list$status <- NA

# Installing ----
# Installing remotes in case package required specific version
if(!all(is.na(pkg_list$version))){
    install.packages("remotes", repos = cran_mirror)
}

for(i in 1:nrow(pkg_list)){
    cat("\033[0;92m", paste("Installing", pkg_list$package[i]), "\033[0m\n", sep = "")
    if(is.na(pkg_list$version[i])){
        # No package version 
        # Installing the most recent version from CRAN
        install.packages(pkgs = pkg_list$package, 
                         repos = cran_mirror, 
                         quiet = quiet)
    } else {
        # Installing specific version
        remotes::install_version(package = pkg_list$package[i],
                                 version = pkg_list$version[i],
                                 dependencies = c("Depends", "Imports"),
                                 upgrade = FALSE,
                                 #verbose = FALSE,
                                 quiet = quiet,
                                 repos = cran_mirror)


    }

    if(i %in% rownames(installed.packages())){
    pkg_list$status[i] <- TRUE
  } else {
    pkg_list$status[i] <- FALSE
  }
}
# Return report
  for(i in 1:nrow(pkg_list)){
    if(pkg_list$status[i]){
        cat("\033[0;92m", paste(pkg_list$package[i]),"...installed successfully",  "\033[0m\n", sep = "")
    } else {
        cat("\033[0;91m", paste(pkg_list$package[i]),"...failed",  "\033[0m\n", sep = "")
    }
  }


