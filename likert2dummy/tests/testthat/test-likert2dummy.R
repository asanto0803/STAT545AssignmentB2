test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})



#Test 1: Test that the maximum value in the column modified by my likert2dummy function is 1, and the minimum value in the modified column is 0*
test1 <- test_that("Returns a maximum of 1 and minimum of 0", {
  expect_equal(max(likert2dummy(food_purchasing, where_shop_1)$where_shop_1), 1)
  expect_equal(min(likert2dummy(food_purchasing, where_shop_1)$where_shop_1), 0)
})

test1


#Test 2: Test that the likert2dummy function will only work for numerical data in my dataset. Inputting a character data column (such as Response Id) will result in failure*
#Test the function on a character column to see if it throws and error
test2 <- test_that("doesn't work when character input", {
  expect_error(likert2dummy(food_purchasing, ResponseId))
})

test2


#Example 3: Test that the output of the likert2dummy function is of the class "data frame"*
# Test that the function returns a data frame
test3 <- test_that ("returns df", {
  expect_s3_class(likert2dummy(food_purchasing, where_shop_1), "data.frame")
})
