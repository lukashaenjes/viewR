view_selection_tidy <- function(){

  context <- rstudioapi::getSourceEditorContext()

  selection <- base::trimws(context$selection[[1]]$text)

  title <- paste0(stringr::str_extract(string = selection,
                                       #pattern = "([^\\s]+)"),
                                       # pattern = "[^ %]*"),
                                       pattern = ".+(?= %)"),
                  "_view")

  rstudioapi::sendToConsole(
    glue::glue(selection,
               " %>%\n  View(title = \"{title}\")")
  )

}

view_selection <- function(){

  context <- rstudioapi::getSourceEditorContext()

  selection <- base::trimws(context$selection[[1]]$text)

  title <- base::unlist(
    base::regmatches(selection,
                     base::regexec(".+(?= %)",
                                   selection,
                                   perl = TRUE)
    )
  )

  title <- base::paste0(title, "_view")

  rstudioapi::sendToConsole(
    base::paste0(selection,
                 " %>%\n  View(title = '", title,"')")
  )

}


# TODO:
# match title bis erstes % statt bis ersten space
# take base View with "title"
# if pipe is at the end then remove
# dplyr is used, however since this package is intended for use with dplyr the
#   piping made sense -- usethis::usepipe
# take out deps


#
#
# x <- rstudioapi::getSourceEditorContext()
#
# x$selection[[1]]$text
#
# rstudioapi::sendToConsole("asdf <- 5")
#
#
# test <- mtcars %>%
#   dplyr::bind_rows(mtcars) %>%
#   dplyr::bind_rows(mtcars) %>%
#   tibble::as_tibble()
#
# rstudioapi::sendToConsole(paste0(x$selection[[1]]$text, " %>%\n  View()"))
#
# title <- paste0(stringr::str_extract(string = x$selection[[1]]$text,
#                                      pattern = "([^\\s]+)"), "_view")
#
# rstudioapi::sendToConsole(glue::glue(x$selection[[1]]$text, " %>%\n  tibble::view(title = \"{title}\")"))
#
# test %>%
#   dplyr::filter(mpg < 20) %>%
#   tibble::view(title = "asdf")
#
# glue::glue("This is {obj}", obj = "asdf")
# #
