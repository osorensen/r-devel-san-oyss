# Docker container for testing R packages

This is my container for checking R packages. It is based on [rocker/r-devel-san](https://github.com/rocker-org/r-devel-san), but I've added installation of the packages required in the packages I'm maintaing, to allow re-use.

Build on M1 Mac using:

```
docker build --platform linux/amd64 -t r-devel-san-oyss:v1 .
```

Run on M1 Mac using:

```
docker run -v "$(pwd)":"/opt/$(basename $(pwd))" --platform linux/amd64 -it --cap-add=SYS_PTRACE r-devel-san-oyss:v1 /bin/bash
```


On Intel Mac, remove `--platform linux/amd64`.

Remember to use `RD` and not `R`. For example, `RD CMD build .`.

For checking package "BayesMallows", here is what's needed:

```
RD CMD build BayesMallows/ --no-build-vignettes
```

```
RD CMD INSTALL BayesMallows*.tar.gz
```

Then `cd` into `BayesMallows/tests` and run this:

```
library(BayesMallows)
library(testthat)
test_check("BayesMallows", reporter = LocationReporter)
```