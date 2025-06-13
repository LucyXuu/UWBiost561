---
output: github_document
---

# Purpose

This is a demo package for UW BIOST 561 (Spring 2025), taught by Kevin Lin.

- The URL to the GitHub (i.e., the source code) is: https://github.com/LucyXuu/UWBiost561
- The URL to the Pkgdown webpage is: 

# How to install
This package is called `UWBiost561`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("LucyXuu/UWBiost561")
```

Upon completion, you can run the following code (in R):
```R
library(UWBiost561)
UWBiost561::run_example()
```

# Dependencies

The package depends on the following packages: `MASS` and `mvtnorm`.

# Session info

This package was developed in the following environment
```R
> devtools::session_info()
─ Session info ──────────────────────────
 setting  value
 version  R version 4.5.0 (2025-04-11)
 os       mingw32
 system   x86_64, mingw32
 ui       RStudio
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       America/Los_Angeles
 date     2025-03-16
 rstudio  2023.09.1+494 Desert Sunflower (desktop)
 pandoc   NA

```
