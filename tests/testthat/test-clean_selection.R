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

test_that("a warning is issued in case of truncated selection", {

  string <- "iris %>%\n  head() %>%\n  filter("
  withr::local_options(viewR.warn.truncated = TRUE)

  expect_warning(clean_selection(string))

})

test_that("no warning is issued when warnings are disabled", {

  string <- "iris %>%\n  head() %>%\n  filter("
  withr::local_options(viewR.warn.truncated = FALSE)

  res <- clean_selection(string)
  expect_identical(res, "iris %>%\n  head()")

})
