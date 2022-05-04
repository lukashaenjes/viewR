#' @title View selected lines in RStudio data viewer
#'
#' @description This function unfolds its full potential when it's mapped to a
#'   sensible keyboard shortcut: In RStudio, navigate to 'Tools' > 'Modify
#'   Keyboard Shortcuts' and then search for 'View current selection'. Click on
#'   the 'Shortcut' field to assign a new keyboard shortcut.
#'
#' @importFrom rstudioapi getSourceEditorContext isAvailable
#'
#' @seealso For a more detailed overview and a demo, please check the
#'   \href{https://github.com/lukasfeick-sw/viewR}{GitHub repository}.
#'
#' @export

view_selection <- function() {

  # capture context
  context <- if (isAvailable()) getSourceEditorContext() else NULL

  # extract selected lines, removing whitespace
  selection <- if (!is.null(context)) trimws(context$selection[[1]]$text) else ""

  # clean selection
  selection_cleaned <- clean_selection(selection)

  # parse selection
  selection_parsed <- parse_selection(selection_cleaned)

  # send selection
  out <- send_selection(selection_cleaned, selection_parsed)

  # needed for testing
  invisible(list(selection_cleaned, selection_parsed, out))

}
