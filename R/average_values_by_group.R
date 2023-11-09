#' @title Average Values By Group Function
#'
#' @description This function takes a dataset and groups it by a chosen variable, then finds the mean value of a chosen measure for each group.
#'
#' @param dataset is the parameter for the **dataset** you are inputting into the function.
#' @param group is the parameter for the variable you choose to **group** the dataset by. This variable should be a column name from the dataset.
#' @param measure is the parameter for the **measure** you choose to find the mean value of for each of the groups. The column you choose for the measure parameter must have numeric values.
#'
#'@importFrom dplyr pull
#'@importFrom dplyr group_by
#'@importFrom dplyr summarize
#'
#' @return This function returns a dataframe with each *group* in the first column, and the *mean value of the measure for each group* in the second column.
#' @export
#'
#' @examples
#'
#'library(tibble)
#'
#' sample_data_1 <- tibble(
#'   Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
#'   Age = c(25, 32, 28, 22, 30),
#'   City = c("New York", "New York", "New York", "Houston", "Houston"),
#'   Hobby = c("Gaming", "Cooking", "Gaming", "Gaming", "Cooking"))
#'
#' sample_data_2 <- tibble(
#'   Gender = c("Female", "Male", "Male", "Male", "Female"),
#'   Grade = c(94, 78, 82, NA, 88))
#'
#' average_values_by_group(sample_data_1, City, Age)
#' average_values_by_group(sample_data_1, Hobby, Age)
#' average_values_by_group(sample_data_2, Gender, Grade)


average_values_by_group <- function(dataset, group, measure) {
  var <- dataset %>% pull({{measure}}) %>% is.numeric()
  if(!var) {
    stop("The 'measure' parameter must have numeric values.")
  }
  dataset %>% group_by({{group}}) %>% summarize(average = mean({{measure}}, na.rm = TRUE))
}
