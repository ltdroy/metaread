test_that("colnames are santised", {

  output <- tibble::tibble(
    `Add me` = c(1,2,3),
    `remov!me` = c(1,2,3),
    `did4 -=)_6` = 1,
    `just_this!"£$%^&*()+@'~` = 1
  ) %>%
    sanitise_df_colnames()

  expected <- tibble::tibble(
    `addme` = c(1,2,3),
    `removme` = c(1,2,3),
    did4_6 = 1,
    justthis = 1
  )

  testthat::expect_equal(
    output,
    expected
  )

})
