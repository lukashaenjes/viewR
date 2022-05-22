test_that("view selection works", {

  res <- view_selection()
  exp <- list(character(0), NULL, "_view")

  expect_identical(res, exp)

})
