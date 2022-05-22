test_that("title extraction works", {

  parsed_df <- structure(
    list(
      token = c(
        "expr",
        "SYMBOL",
        "expr",
        "SPECIAL",
        "expr",
        "expr",
        "SYMBOL_PACKAGE",
        "NS_GET",
        "SYMBOL_FUNCTION_CALL",
        "'('",
        "NUM_CONST",
        "expr",
        "')'"
      ),

      text = c(
        "",
        "iris",
        "",
        "%>%",
        "",
        "",
        "dplyr",
        "::",
        "select",
        "(",
        "1",
        "",
        ")"
      )
    ),
    row.names = c(18L, 1L, 3L, 2L, 16L, 8L, 5L, 6L, 7L, 9L, 10L, 11L, 12L),
    class = "data.frame"
  )

  cleaned <- "iris %>%\n  dplyr::select(1)"

  res <- send_selection(selection_parsed = parsed_df, selection_cleaned = cleaned)

  exp <- "iris_view"

  expect_identical(res, exp)

})
