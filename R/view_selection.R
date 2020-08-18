#' View selected lines in RStudio data viewer
#'
#' @importFrom rstudioapi getSourceEditorContext sendToConsole
#' @importFrom magrittr %>%
#'
#' @export
#'

view_selection <- function(){

  # capture context
  context <- getSourceEditorContext()

  # extract selected lines, removing whitespace
  selection <- trimws(context$selection[[1]]$text)

  # remove everything after the last closing bracket
  selection <- unlist(
    regmatches(selection,
               regexec("[^)]+$",
                       selection,
                       perl = TRUE),
               invert = TRUE
    )
  )[1]

  # extract the title: everything before the first '%' (start of the pipe)
  title <- trimws(unlist(
    regmatches(selection,
               regexec("^[^%]+",
                       selection,
                       perl = TRUE)
    )
  ))

  # append title
  title <- paste0(title, "_view")

  # paste `View` call and send to console
  sendToConsole(
    paste0(selection,
           " %>%\n  View(title = '", title,"')")
  )

}

# test <- mtcars %>%
#   dplyr::bind_rows(mtcars) %>%
#   dplyr::bind_rows(mtcars) %>%
#   tibble::as_tibble()
