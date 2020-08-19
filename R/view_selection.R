#' @title View selected lines in RStudio data viewer
#'
#' @description This function unfolds its full potential when it's mapped to a
#'   sensible keyboard shortcut: In RStudio, navigate to 'Tools' > 'Modify
#'   Keyboard Shortcuts' and then search for 'View current selection'. Click on
#'   the 'Shortcut' field to assign a new keyboard shortcut.
#'
#' @importFrom rstudioapi getSourceEditorContext sendToConsole
#' @importFrom magrittr %>%
#'
#' @seealso For a more detailed overview and a demo, please check the
#'   \href{https://github.com/lukasfeick-sw/viewR}{GitHub repository}.
#'
#' @export

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
