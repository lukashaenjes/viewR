#' Send selection to console
#'
#' @param selection_cleaned Cleaned line(s) as character string
#' @param selection_parsed A `data.frame` as returned by `parse_selection()`
#' @importFrom rstudioapi sendToConsole isAvailable
#' @importFrom magrittr %>%
#'
#' @keywords internal

send_selection <- function(selection_cleaned, selection_parsed) {

  # the title will be the first "SYMBOL"
  title <- selection_parsed[selection_parsed$token == "SYMBOL", "text"][1]

  # append suffix to title
  title_view <- paste0(title, "_view")

  # paste `View` call
  to_send <- paste0(selection_cleaned, " %>%\n  View(title = '", title_view, "')")

  # only run if RStudio is available (needed for testing)
  if (isAvailable() && !is.null(title)) {

    # send to console
    sendToConsole(to_send)

  }

  invisible(title_view)

}
