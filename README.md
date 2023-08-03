
# mklcustom

<!-- badges: start -->
<!-- badges: end -->

The goal of the package mklcustom is to provide some convenience functions for myself, Marian Klose.

## Installation

You can install the development version of mklcustom from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("marianklose/mklcustom")
```

So far this is only intended to be used privately by my own. Since the repo is private the following workflow needs to be used to install:

``` r
#set config
usethis::use_git_config(user.name = "YourName", user.email = "your@mail.com")

#Go to github page to generate token
usethis::create_github_token() 

#paste your PAT into pop-up that follows...
credentials::set_github_pat()

#now remotes::install_github() will work
remotes::install_github("username/privaterepo")
```