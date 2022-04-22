#' @title View selected lines in RStudio data viewer
#'
#' @description This function unfolds its full potential when it's mapped to a
#'   sensible keyboard shortcut: In RStudio, navigate to 'Tools' > 'Modify
#'   Keyboard Shortcuts' and then search for 'View current selection'. Click on
#'   the 'Shortcut' field to assign a new keyboard shortcut.
#'
#' @importFrom rstudioapi getSourceEditorContext sendToConsole
#' @importFrom magrittr %>%
#' @importFrom utils getParseData
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

  # remove everything after the last closing bracket (e.g. trailing pipe)
  selection_stripped <- unlist(
    regmatches(selection,
               regexec("[^)]+$",
                       selection,
                       perl = TRUE),
               invert = TRUE
    )
  )[1]

  # if only a single line / dataframe without any brackets is selected,
  # selection_stripped will be empty, so keep everything before first %
  if (nchar(selection_stripped) == 0) {

    selection_stripped <- trimws(unlist(
      regmatches(selection,
                 regexec("^[^%]+",
                         selection,
                         perl = TRUE)
      )
    ))

  }

  # get parse data
  # parsing may fail if there is a trailing pipe in the comments
  parsed <- tryCatch({

    getParseData(parse(text = selection_stripped, keep.source = TRUE))

  }, error = function(e){

    # in case of a trailing non-stripped pipe, simply add a new line
    # and pipe into an `invisible()` so the parsing works out
    inv <- paste0(selection_stripped, "\n invisible()")
    getParseData(parse(text = inv, keep.source = TRUE))

  })

  # the title will be the first "SYMBOL"
  title <- parsed[parsed$token == "SYMBOL", "text"][1]

  # append title
  title <- paste0(title, "_view")

  # paste `View` call and send to console
  sendToConsole(
    paste0(selection_stripped,
           " %>%\n  View(title = '", title,"')")
  )

}
