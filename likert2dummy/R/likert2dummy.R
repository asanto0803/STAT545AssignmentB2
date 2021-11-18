# Make function that turns Likert-scale items into dummy variables, document using Roxygen2
#' @title Convert variable with 5-pt Likert-scale to dummy variable
#' @description This function converts 5-pt Likert scales to dummy variables using the rule that a 4 or 5 on a Likert scale will = 1 on the dummy scale, and a 3, 2, or 1 on Likert scale will = 0 on a dummy scale.
#' @param df A data frame from which you will pull the vector you plan to modify. This parameter is called df to stand for "data frame".
#' @param x A vector of Likert-scale responses (in numerical form, will not work for character data) that will be turned in to dummy variable. This parameter is called "x" in the function to represent that it can be any single column within the data frame.
#' @return A vector of numbers resulting from converting 5-pt scale to a dummy variable.
#' @examples
#'
#' var1 <- c(1,3,5,4,2,3,1)
#' var2 <- c(2,4,5,NA,2,1,1)
#' df <- data.frame(var1, var2)
#' likert2dummy(df, var1)
#' likert2dummy(df, var2)
#'
#' x <-c(1,5,2,2,1)
#' y <-c(1:5)
#' df1 <- data.frame(x,y)
#' df2 <- likert2dummy(df1, x)
#' df3 <- likert2dummy(df2, y)
#'
#'@export
likert2dummy <- function(df, x) {
  test1 <- df %>%
    pull({{x}})
  if(!is.numeric(test1)) {
    stop("This function only works with numeric input.You have provided an object of class: ", class(test1))
  }
  if(!is.data.frame(df)) {
    stop("This function requires a data frame as an input. You have provided an object of class: ", class(df))
  }
  df %>%
    dplyr::mutate({{x}} := dplyr::case_when(
      {{x}} <= 3 ~ 0,
      {{x}} >= 4 ~ 1))
}
