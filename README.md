
<!-- README.md is generated from README.Rmd. Please edit that file -->

# marco

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/simplermd)](https://CRAN.R-project.org/package=simplermd)
<!-- badges: end -->

The goal of `marco` is to provide templates for some of the Rmarkdown
documents that I find useful. The Rmarkdown is powered by
[bookdown](https://bookdown.org/yihui/bookdown/) which allows for all
sort of nice things, like cross-references and captions.

## The templates

### Metropolis presentation

The most complete template is the one for creating a (LaTeX) [beamer
metropolis presentation](https://github.com/matze/mtheme) in Rmarkdown
powered by `bookdown::beamer_presentation2`. This template just
exemplifies all the things I tend to use and forget how to do: multiple
columns, scaled figures, hooks for having code of different sizes, etc.

### Clean html2

Just a clean `bookdown::htm_document2`.

### Clean pdf2

Just a clean `bookdown::pdf_document2`.

## Installation

The package requires either an up-to-date version of
[RStudio](http://www.rstudio.com/) or
[pandoc](http://johnmacfarlane.net/pandoc/). If you want to create PDF-
you additionally need a [TeX](http://de.wikipedia.org/wiki/TeX)
distribution. If you have no use for TeX beyond rendering R Markdown
documents, I recommend you use [TinyTex](https://yihui.name/tinytex/).
TinyTex can be installed from within R as follows.

``` r
if(!"tinytex" %in% rownames(installed.packages())) install.packages("tinytex")
tinytex::install_tinytex()
```

Otherwise consider [MikTeX](http://miktex.org/) for Windows,
[MacTeX](https://tug.org/mactex/) for Mac, or [TeX
Live](http://www.tug.org/texlive/) for Linux.

`marco` is not yet available on CRAN but you can install it from this
repository:

``` r
#install.packages("devtools")
remotes::install_github("bnicenboim/marco")
```

## How to use `marco`

### Rstudio

Once `marco` is installed, you can select the appropriate template when
creating a new Markdown file through the RStudio menus.

### Emacs

If `polymode` is installed you should be able to use
`poly-r-rmarkdown-create-from-template`.

### Otherwise

Use the `rmarkdown::render` function to create templates.

For metropolis presentations:

``` r
# Create new R Markdown file
rmarkdown::draft(
  "slides.Rmd"
  , template =  "metropolis-presentation"
  , package = "marco"
  , create_dir = FALSE
  , edit = FALSE
)
# Render manuscript
rmarkdown::render("slides.Rmd")
```

For the other templates, `template` should be `"clean-html2"` or
`"clean-pdf2"`.

### Other useful rmarkdown packages:

  - [papaja](https://github.com/crsh/papaja): APA articles. (Also credit
    to F. Aust for the installation instructions here).
  - [komaletter](https://github.com/rnuske/komaletter): Letters.
  - [binb](https://github.com/eddelbuettel/binb): More presentations.
