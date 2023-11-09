test_that("average_values_by_group takes the average value of each group", {
  sample_data1 <- data.frame(Group = c("A", "A", "B", "B", "B"), Value = c(10, 20, 30, 40, 50))
  result <- average_values_by_group(sample_data1, Group, Value)
  expect_gt(result$average[2], result$average[1])
})

test_that("average_values_by_group works when the measure has NA values", {
  sample_data2 <- data.frame(Group = c("A", "A", "B", "B", "B"), Value = c(10, 20, NA, 40, 50))
  result <- average_values_by_group(sample_data2, Group, Value)
  expect_lt(result$average[1], result$average[2])
})

test_that("average_values_by_group gives the programmed error message when the measure parameter is not numeric", {
  sample_data3 <- data.frame(Group = c("A", "A", "B", "B", "B"), Value = c("one", "two", "three", "four", "five"))
  expect_error(average_values_by_group(sample_data3, Group, Value), "The 'measure' parameter must have numeric values.")
})
