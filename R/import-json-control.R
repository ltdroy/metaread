#' Import a control JSON file and standardise its contents
#' ready for use as read function arguments
#'
#' @param file string location of the file
#'
#' @return list object
#' @export
#'
import_control_json <- function(file){

  jsonlite::validate(file)

  control_data <- jsonlite::read_json(
    file
  )

  control_data <- purrr::map(
    control_data,
    transform_json_for_control
  )

  return(control_data)

}

#' Transform json list item to argument-ready data structure
#'
#' @param json_list_item Item ready from jsonlite
#' @param item_name Name of item
#'
#' @return value
#'
transform_json_for_control <- function(json_list_item, item_name="unnamed"){

  item_type <- dplyr::case_when(
    is.vector(json_list_item) & length(json_list_item) == 1 ~ "value",
    is.list(json_list_item) &
      length(names(json_list_item)) == 0 &
      is.vector(json_list_item[[1]]) ~ "valueset",
    is.list(json_list_item) &
      length(names(json_list_item)) == 0 &
      length(json_list_item) == 1 &
      is.list(json_list_item[[1]]) &
      length(names(json_list_item[[1]])) > 1 ~ "named-valueset",
    is.list(json_list_item) &
      length(names(json_list_item)) > 0 &
      length(json_list_item) > 1 &
      is.vector(json_list_item[[1]]) ~ "named-list",
    TRUE ~ "unknown"
  )

  transformation <- switch(
    item_type,
    "value" = function(x){x},
    "valueset" = function(x){purrr::reduce(x,c)},
    "named-valueset" = function(x){
      purrr::reduce(x[[1]], c) |>
        purrr::set_names(names(x[[1]]))
    },
    "named-list" = function(x){x},
    "unknown" = function(x){x}
  )

  if(item_type == "unknown"){
    warning(item_name,
            " doesnt have a recognised structure, using defaults from jsonlite")
  }

  return(
    transformation(json_list_item)
  )


}
