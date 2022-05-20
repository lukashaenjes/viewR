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

  # whether to print warnings (default yes)
  warn <- getOption("viewR.warn.truncated", TRUE)

  # for testing purposes
  if (length(selection_stripped) == 0) return(selection_stripped)

  # if objects are different and warnings are activated
  if (x != selection_stripped && warn) {

    # split each object into single characters
    split_a <- strsplit(x, "")[[1]]
    split_b <- strsplit(selection_stripped, "")[[1]]

    # get differences
    trunc <- suppressWarnings(paste(split_a[split_a != split_b], collapse = ""))

    # remove linebreaks
    trunc <- gsub(pattern = "\n", replacement = "", x = trunc)

    # remove double-whitespace
    trunc <- gsub(pattern = "  ", replacement = " ", x = trunc)

    # only warn if truncated part is not only the trailing pipe
    if (trimws(gsub(x = trunc, pattern = "%>%", replacement = "")) != "") {

      warning("Selection truncated! Removed the following part: '", trunc, "'")

    }

  }

  return(selection_stripped)

}
