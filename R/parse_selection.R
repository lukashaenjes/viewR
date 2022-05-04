#' Parse selection
#'
#' @param x Cleaned line(s) as character string
#' @importFrom utils getParseData
#'
#' @keywords internal

parse_selection <- function(x) {

  # get parse data
  # parsing may fail if there is a trailing pipe in the comments
  parsed <- tryCatch({

    getParseData(parse(text = x, keep.source = TRUE))

  }, error = function(e) {

    # in case of a trailing non-stripped pipe, simply add a new line
    # and pipe into an `invisible()` so the parsing works out
    inv <- paste0(x, "\n invisible()")
    getParseData(parse(text = inv, keep.source = TRUE))

  })

  return(parsed)

}
