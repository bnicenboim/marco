# 
#' Add an emoji in an Rmarkdown document.
#'
#' Add an emoji to an Rmarkdown file. This is a wrapper of [emo::ji] that will download the emoji and will add it as an image, if the Rmarkdown document will be compiled in latex to pdf.  Code adapted from Hadley Wickham's code in [https://github.com/hadley/adv-r/blob/master/emoji.R]. Use [emo::ji_name] to get a list of unique names.
#'
#' @param x Either name or keyword. If more than one emoji has the specified keyword, will pick one at random.
#' @param folder Folder to store the emojis. Only relevant in a Rmd file compiled in latex.
#'
#' @export
#'
#' @examples
#' emoji("face")
#'  
#' 
emoji <- function(x, folder = "emoji") {
  x <- emo::ji(x)
  
  if (knitr::is_latex_output()) {
    path <- emoji_png(x, folder)
    paste0("\\raisebox{-.1\\height}{\\includegraphics[height=10pt]{", path, "}}")
  } else {
    x
  }
}

emoji_png <- function(x, folder = "emoji") {
  if(!dir.exists(folder)) dir.create(folder)
  local <- paste0(folder,"/", emoji_code(x), ".png")
  if (!file.exists(local)) {
    src <- paste0(
      "https://raw.githubusercontent.com/twitter/twemoji/master/assets/72x72/",
      emoji_code(x),
      ".png"
    )
    download.file(src, local, quiet = TRUE)
  }
  local
}

emoji_code <- function(x) {
  sprintf("%x", utf8ToInt(x))
}
