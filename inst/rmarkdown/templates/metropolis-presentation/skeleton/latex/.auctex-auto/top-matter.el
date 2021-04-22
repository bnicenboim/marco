(TeX-add-style-hook
 "top-matter"
 (lambda ()
   (TeX-run-style-hooks
    "caption")
   (TeX-add-symbols
    '("hideFromPandoc" 1)
    "Begin"
    "End"))
 :latex)

