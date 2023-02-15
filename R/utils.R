


#' Subsets a bib(la)tex file with the bibliography actually used in an Rmd file
#'
#' Subsets a bib(la)tex file with the bibliography actually used in an Rmd file. Adapted from https://stackoverflow.com/questions/65306015/in-rmarkdown-is-there-a-way-to-create-a-bib-file-for-only-those-keys-cited-in
#' 
#' @param rmdfile An Rmd file.
#' @param bibfile Its bib(la)tex file.
#' @param newfile The new bib(la)tex file.
#'
#' @return The new bibliography in a file if specified
#' @export
#'
bib_subset <- function(rmdfile, bibfile, newfile = NULL){
  lines <- paste(readLines(rmdfile), collapse = "")
  entries <- unique(stringr::str_match_all(lines, "@([a-zA-Z0-9]+)[,\\. \\?\\!\\]\\;]")[[1]][, 2])
  
  bib <- paste(readLines(bibfile), collapse = "\n")
  bib <- unlist(strsplit(bib, "\n@"))
  
  output <- sapply(entries, grep, bib, value = TRUE) 
  not_found <- output[lengths(output)==0]
  warning("The following keys couldn't be found in the file '", 
          bibfile,"':\n",
          paste0(names(not_found),collapse = ", "))
  output <- output[lengths(output)>0]
  output <- paste("@", output, sep = "")
  output <- unlist(output)
 
  if(!is.null(newfile)){
    writeLines(output, newfile)
  } else {
    output
  }
}
