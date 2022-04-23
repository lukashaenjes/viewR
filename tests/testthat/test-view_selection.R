test_that("title_extraction_works", {

  string_1 <- "iris %>% dplyr::select(1)"
  string_2 <- "as.data.frame(iris) %>% dplyr::select(1)"

  res1 <- getParseData(parse(text = string_1, keep.source = TRUE))
  title_1 <- res1[res1$token == "SYMBOL", "text"][1]

  res2 <- getParseData(parse(text = string_2, keep.source = TRUE))
  title_2 <- res2[res2$token == "SYMBOL", "text"][1]

  expect_identical(title_1, title_2)

})

test_that("parsing_fails_with_trailing_pipe_in_comments", {

  string_1 <- "as.data.frame(iris) %>%\n  dplyr::select(1) %>% # comment"
  expect_error(getParseData(parse(text = string_1, keep.source = TRUE)))

})

test_that("trailing_pipe_in_comments_can_be_fixed", {

  string_1 <- "as.data.frame(mtcars) %>%\n  dplyr::select(1) %>% # comment"
  invis <- paste0(string_1, "\n invisible()")
  res <- getParseData(parse(text = invis, keep.source = TRUE))
  title <- res[res$token == "SYMBOL", "text"][1]

  expect_identical(title, "mtcars")

})
