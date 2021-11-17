
<!-- README.md is generated from README.Rmd. Please edit that file -->

# likert2dummy

The goal of likert2dummy is to turn 5-pt Likert-scale or Likert-type
scale items into dummy variables. This function converts 5-pt Likert
scales to dummy variables using the rule that a 4 or 5 on a Likert scale
will = 1 on the dummy scale, and a 3, 2, or 1 on Likert scale will = 0
on a dummy scale.

## Installation

You can install the released version of likert2dummy from Github using:

``` r
# install.packages("devtools")
devtools::install_github("asanto0803/STAT545AssignmentB2/")
```

## Example

This is a basic examples which shows you how to solve a common problem:

``` r
library(likert2dummy)
#> Loading required package: tidyverse
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
#> ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
#> ✓ tibble  3.1.5     ✓ dplyr   1.0.7
#> ✓ tidyr   1.1.4     ✓ stringr 1.4.0
#> ✓ readr   2.0.2     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()

# Example 1
var1 <- c(1,3,5,4,2,3,1)
var2 <- c(2,4,5,NA,2,1,1)
df <- data.frame(var1, var2)
likert2dummy(df, var1)
#>   var1 var2
#> 1    0    2
#> 2    0    4
#> 3    1    5
#> 4    1   NA
#> 5    0    2
#> 6    0    1
#> 7    0    1
likert2dummy(df, var2)
#>   var1 var2
#> 1    1    0
#> 2    3    1
#> 3    5    1
#> 4    4   NA
#> 5    2    0
#> 6    3    0
#> 7    1    0
```
