
# Dockerfile for for R base image with INLA installed
# after installation, can be used interactively with:
# sudo docker run --rm -it docker_r_base bash
FROM ghcr.io/dhis2-chap/docker_r_inla:master

# Add any RUNS here to instal additional packages. For instance, the next line is an example on how to install the spdep package
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("spdep"), repos=c(getOption("repos"), dep=TRUE))'


