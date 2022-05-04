test_that("trailing pipes are removed", {

  string <- "as.data.frame(mtcars) %>%\n  dplyr::select(1) %>%"
  res <- clean_selection(string)
  expected <- "as.data.frame(mtcars) %>%\n  dplyr::select(1)"

  expect_identical(res, expected)

})

test_that("viewR works on single-line selections", {

  string <- "iris %>% "
  res <- clean_selection(string)

  expect_identical(res, "iris")

})
