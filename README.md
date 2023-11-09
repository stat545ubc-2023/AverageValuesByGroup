
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AverageValuesByGroup

<!-- badges: start -->
<!-- badges: end -->

The goal of AverageValuesByGroup is to take a dataset and group it by a
chosen variable, then find the mean value of a chosen measure for each
group.

## Installation

You can install the development version of AverageValuesByGroup from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/assignment-b2-jchalissery14")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(AverageValuesByGroup)
library(tibble)

sample_data <- tibble(
  Gender = c("Female", "Female", "Male", "Male", "Female"),
  Grade = c(74, 98, 62, 84, 88))

average_values_by_group(sample_data, Gender, Grade)
#> # A tibble: 2 × 2
#>   Gender average
#>   <chr>    <dbl>
#> 1 Female    86.7
#> 2 Male      73
```

Notice that average_values_by_group returns a dataframe with each
*group* in the first column, and the *mean value of the measure for each
group* in the second column.

The *measure* parameter must have numeric values, otherwise it will
return a programmed error. This function still works if there are NA
values in the chosen measure parameter.

``` r
library(devtools)
#> Loading required package: usethis
library(testthat)
#> 
#> Attaching package: 'testthat'
#> The following object is masked from 'package:devtools':
#> 
#>     test_file

test_that("average_values_by_group works when the measure has NA values", {
  sample_data2 <- data.frame(Group = c("A", "A", "B", "B", "B"), Value = c(10, 20, NA, 40, 50))
  result <- average_values_by_group(sample_data2, Group, Value)
  expect_lt(result$average[1], result$average[2])
})
#> Test passed

test_that("average_values_by_group gives the programmed error message when the measure parameter is not numeric", {
  sample_data3 <- data.frame(Group = c("A", "A", "B", "B", "B"), Value = c("one", "two", "three", "four", "five"))
  expect_error(average_values_by_group(sample_data3, Group, Value), "The 'measure' parameter must have numeric values.")
})
#> Test passed
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
