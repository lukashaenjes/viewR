test_that("parse_selection works", {

  string_1 <- "iris %>% dplyr::select(1)"
  string_2 <- "as.data.frame(iris) %>% dplyr::select(1)"

  res1 <- parse_selection(string_1)
  title_1 <- res1[res1$token == "SYMBOL", "text"][1]

  res2 <- parse_selection(string_2)
  title_2 <- res2[res2$token == "SYMBOL", "text"][1]

  expect_identical(title_1, title_2)

})

test_that("trailing pipe in comments can be fixed", {

  string_1 <- "as.data.frame(mtcars) %>%\n  dplyr::select(1) %>% # comment"
  res <- parse_selection(string_1)
  title <- res[res$token == "SYMBOL", "text"][1]

  expect_identical(title, "mtcars")

})
