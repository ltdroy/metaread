#' Sanitise colname vector to lower camel case
#'
#' @param name_vec character vector of column names
#'
#' @return character vector in lower camel case
#' @export
#'
sanitise_colnames <- function(name_vec){

  snakecase::to_lower_camel_case(name_vec) |>
    stringr::str_to_lower()

}

#' Sanitse all column names in a dataframe to lower camel case
#'
#' @param df dataframe
#'
#' @return dataframe with renamed columns
#' @export
#'
#' @examples
sanitise_df_colnames <- function(df){

  df |>
    dplyr::rename_with(sanitise_colnames)

}
