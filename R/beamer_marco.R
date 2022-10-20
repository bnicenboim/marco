

#' Metropolis (beamer) presentation with sensible defaults.
#' 
#' Wrapper for [bookdown::beamer_presentation2] with sensible defaults.
#'
#' @param slide_level By default 2
#' @param toc By default FALSE
#' @param incremental By default FALSE
#' @param ... Other params passed to [bookdown::beamer_presentation2]
#'
#' @return An R Markdown output format object to be passed to [rmarkdown::render()].
#' @export
#'
beamer_metropolis <- function(slide_level = 2, toc = FALSE, incremental = FALSE, ...) {

  # get the locations of resource files located within the package
  header <- system.file("latex/top-matter.tex", package = "marco")

  # call the base html_document function
  bookdown::beamer_presentation2(
    theme = "metropolis",
    latex_engine = "xelatex",
    slide_level = slide_level,
    incremental = incremental,
    toc = toc,
    includes = rmarkdown::includes(in_header = header), ...
  )
}
