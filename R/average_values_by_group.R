#' @title Average Values By Group Function
#'
#' @description This function takes a dataset and groups it by a chosen variable, then finds the mean value of a chosen measure for each group.
#'
#' @param dataset is the parameter for the **dataset** you are inputting into the function.
#' @param group is the parameter for the variable you choose to **group** the dataset by. This variable should be a column name from the dataset.
#' @param measure is the parameter for the **measure** you choose to find the mean value of for each of the groups. The column you choose for the measure parameter must have numeric values.
#'
#' @return This function returns a dataframe with each *group* in the first column, and the *mean value of the measure for each group* in the second column.
#' @export
#'
#' @examples
#' average_values_by_group(vancouver_trees, genus_name, diameter)
#' average_values_by_group(vancouver_trees, species_name, latitude)
#' average_values_by_group(penguins, island, bill_length_mm)


average_values_by_group <- function(dataset, group, measure) {
  var <- dataset %>% pull({{measure}}) %>% is.numeric()
  if(!var) {
    stop("The 'measure' parameter must have numeric values.")
  }
  dataset %>% group_by({{group}}) %>% summarize(average = mean({{measure}}, na.rm = TRUE))
}
