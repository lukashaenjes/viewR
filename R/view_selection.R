#' @title View selected lines in RStudio data viewer
#'
#' @description This function unfolds its full potential when it's mapped to a
#'   sensible keyboard shortcut: In RStudio, navigate to 'Tools' > 'Modify
#'   Keyboard Shortcuts' and then search for 'View current selection'. Click on
#'   the 'Shortcut' field to assign a new keyboard shortcut.
#'
#' @importFrom rstudioapi getSourceEditorContext isAvailable
#'   getActiveDocumentContext getConsoleEditorContext
#'
#' @seealso For a more detailed overview and a demo, please check the
#'   \href{https://github.com/lukasfeick-sw/viewR}{GitHub repository}.
#'
#' @export

view_selection <- function() {

  # for testing purposes
  if (!isAvailable()) {

    context <- NULL
    selection <- ""

  } else {

    # check whether console or editor is selected because selection needs to be
    # extracted differently - if in console, document id will always be "#console"
    is_editor <- getActiveDocumentContext()$id != "#console"

    # capture context
    if (is_editor) {

      context <- getSourceEditorContext()

      # extract selected lines, removing whitespace
      selection <- trimws(context$selection[[1]]$text)

    } else {

      context <- getConsoleEditorContext()

      # extract selected lines, removing whitespace
      selection <- trimws(context$contents)

    }

  }

  # clean selection
  selection_cleaned <- clean_selection(selection)

  # parse selection
  selection_parsed <- parse_selection(selection_cleaned)

  # send selection
  out <- send_selection(selection_cleaned, selection_parsed)

  # needed for testing
  invisible(list(selection_cleaned, selection_parsed, out))

}
