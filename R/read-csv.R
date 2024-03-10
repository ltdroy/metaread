#' Read a csv file, using the spec in metadata
#'
#' metadata should follow the csv-control template, which is based around the
#' readr::read_csv function, and which can accept all the commonly user arguments
#' from this function.
#'
#' @param file String, path to the file
#' @param metadata A list object following the csv-control template
#'
#' @return A dataframe
#' @export
#'
#'

read_csv_with_meta <- function(file, metadata){

  supported_args <- list(
    delim = NULL,
    quote = "\"",
    escape_backslash = FALSE,
    escape_double = TRUE,
    col_names = TRUE,
    col_types = readr::cols(.default = "character"),
    col_select = NULL,
    id = NULL,
    na = c("", "NA"),
    quoted_na = TRUE,
    comment = "",
    trim_ws = FALSE,
    skip = 0,
    n_max = Inf,
    guess_max = 1000,
    name_repair = "unique",
    skip_empty_rows = TRUE
  )

  for(arg in names(supported_args)){
    if(!arg %in% names(metadata)){
      metadata[[arg]] <- supported_args[[arg]]
    }
  }

  readr::read_csv(
    file = file,
    delim = metadata$delim,
    quote = metadata$quote,
    escape_backslash = metadata$escapte_backslash,
    escape_double = metadata$escape_double,
    col_names = metadata$col_names,
    col_types = metadata$col_types,
    col_select = metadata$col_select,
    id = metadata$id,
    na = metadata$na,
    quoted_na = metadata$quoted_na,
    comment = metadata$comment,
    trim_ws = metadata$trim_ws,
    skip = metadata$skip,
    n_max = metadata$name,
    guess_max = metadata$guess_max,
    name_repair = metadata$name_repair,
    skip_empty_rows = metadata$skip_empty_rows
  )

}
