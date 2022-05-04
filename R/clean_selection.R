#' Clean selection
#'
#' @param x Selected line(s) as character string
#' @importFrom utils getParseData
#'
#' @keywords internal

clean_selection <- function(x) {

  # remove everything after the last closing bracket (e.g. trailing pipe)
  selection_stripped <- unlist(
    regmatches(x,
               regexec("[^)]+$",
                       x,
                       perl = TRUE),
               invert = TRUE
    )
  )[1]

  # if only a single line / dataframe without any brackets is selected,
  # selection_stripped will be empty, so keep everything before first %
  if (nchar(selection_stripped) == 0) {

    selection_stripped <- trimws(unlist(
      regmatches(x,
                 regexec("^[^%]+",
                         x,
                         perl = TRUE)
      )
    ))

  }

  return(selection_stripped)

}
