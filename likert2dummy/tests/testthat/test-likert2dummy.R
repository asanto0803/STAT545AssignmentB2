library(likert2dummy)
library(tidyverse)
library(testthat)

#Test 1: Test that the maximum value in the column modified by my likert2dummy function is 1, and the minimum value in the modified column is 0*

test1 <- test_that("Returns a maximum of 1 and minimum of 0", {
  x <- c(1,5,3,4,1,2,3)
  y <- c(5,5,1,1,3,2,4)
  df <- data.frame(x,y)
  testthat::expect_equal(max(likert2dummy::likert2dummy(df, x)$x), 1)
  testthat::expect_equal(min(likert2dummy::likert2dummy(df, x)$x), 0)
})

#Test 2: Test that the likert2dummy function will only work for numerical data in my dataset. Inputting a character data column (such as Response Id) will result in failure*

a <- c(2,3,unknown,4,1)
b <- c(A,1,4,3,B)
df <- data.frame(a, b)

test2 <- test_that("doesn't work when character input", {
  testthat::expect_error(likert2dummy::likert2dummy(df, a))
})

#Example 3: Test that the output of the likert2dummy function is of the class "data frame"*
# Test that the function returns a data frame

m <-c(5,3,1,2)
n <-c(3,3,1,5)
df <- data.frame(m,n)

test3 <- test_that ("returns df", {
 testthat::expect_s3_class(likert2dummy::likert2dummy(df, m), "data.frame")
})
