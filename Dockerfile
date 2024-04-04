# syntax=docker/dockerfile:1
FROM rocker/r-devel-san

RUN apt-get install -t unstable -y --no-install-recommends git libssl-dev

RUN R -e "install.packages(c('Rcpp', 'ggplot2', 'Rdpack', 'igraph', \
                   'sets', 'relations', 'rlang', 'RcppArmadillo', \
                   'knitr', 'testthat', 'label.switching', 'rmarkdown', \
                   'covr'), \
                   dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN R -e "install.packages(c('lme4', 'Matrix', 'memoise', 'methods', 'mgcv', \
  'nlme', 'Rcpp', 'Rdpack', 'stats', 'covr', 'gamm4', 'knitr', 'PLmixed', \
  'rmarkdown', 'testthat'), dependencies=TRUE, repos='http://cran.rstudio.com/')"
