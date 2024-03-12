test_that("templating works with csv_control and csv read", {

  example_df <- tibble::tibble(
    col_a = as.character(c(1,2,3,4,5,6,7,8,9,10)),
    col_b = c("a")
  )

  metadata <-

  file_loc <- tempfile()

  readr::write_csv(
    example_df,
    file = file_loc
  )



  read_csv_with_meta(
    file = file_loc,
    metadata =
  )





})
