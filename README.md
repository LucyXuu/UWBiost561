---
output: github_document
---

# Purpose

This is a demo package for UW BIOST 561 (Spring 2025), taught by Kevin Lin.

- The URL to the GitHub (i.e., the source code) is: https://github.com/linnykos/561_s2025_example
- The URL to the Pkgdown webpage is: https://linnykos.github.io/561_s2025_example/

# How to install
This package is called `UW561S2025Example`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("linnykos/561_s2025_example")
```

Upon completion, you can run the following code (in R):
```R
library(UW561S2025Example)
UW561S2025Example::run_example()
```

# Dependencies

The package depends on the following packages: `MASS` and `mvtnorm`.

# Session info

This package was developed in the following environment
```R
> devtools::session_info()
─ Session info ──────────────────────────
 setting  value
 version  R version 4.3.2 (2023-10-31)
 os       macOS Sonoma 14.2.1
 system   aarch64, darwin20
 ui       RStudio
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       America/Los_Angeles
 date     2025-03-16
 rstudio  2023.09.1+494 Desert Sunflower (desktop)
 pandoc   NA

─ Packages ──────────────────────────────
 package           * version date (UTC) lib source
 cachem              1.0.8   2023-05-01 [1] CRAN (R 4.3.0)
 cli                 3.6.2   2023-12-11 [1] CRAN (R 4.3.1)
 devtools            2.4.5   2022-10-11 [1] CRAN (R 4.3.0)
 digest              0.6.34  2025-01-11 [1] CRAN (R 4.3.1)
 ellipsis            0.3.2   2021-04-29 [1] CRAN (R 4.3.0)
 fastmap             1.1.1   2023-02-24 [1] CRAN (R 4.3.0)
 fs                  1.6.3   2023-07-20 [1] CRAN (R 4.3.0)
 glue                1.7.0   2025-01-09 [1] CRAN (R 4.3.1)
 htmltools           0.5.7   2023-11-03 [1] CRAN (R 4.3.1)
 htmlwidgets         1.6.4   2023-12-06 [1] CRAN (R 4.3.1)
 httpuv              1.6.14  2025-01-26 [1] CRAN (R 4.3.1)
 later               1.3.2   2023-12-06 [1] CRAN (R 4.3.1)
 lifecycle           1.0.4   2023-11-07 [1] CRAN (R 4.3.1)
 magrittr            2.0.3   2022-03-30 [1] CRAN (R 4.3.0)
 memoise             2.0.1   2021-11-26 [1] CRAN (R 4.3.0)
 mime                0.12    2021-09-28 [1] CRAN (R 4.3.0)
 miniUI              0.1.1.1 2018-05-18 [1] CRAN (R 4.3.0)
 pkgbuild            1.4.3   2023-12-10 [1] CRAN (R 4.3.1)
 pkgload             1.3.4   2025-01-16 [1] CRAN (R 4.3.1)
 profvis             0.3.8   2023-05-02 [1] CRAN (R 4.3.0)
 promises            1.2.1   2023-08-10 [1] CRAN (R 4.3.0)
 purrr               1.0.2   2023-08-10 [1] CRAN (R 4.3.0)
 R6                  2.5.1   2021-08-19 [1] CRAN (R 4.3.0)
 Rcpp                1.0.12  2025-01-09 [1] CRAN (R 4.3.1)
 remotes             2.4.2.1 2023-07-18 [1] CRAN (R 4.3.0)
 rlang               1.1.3   2025-01-10 [1] CRAN (R 4.3.1)
 rstudioapi          0.15.0  2023-07-07 [1] CRAN (R 4.3.0)
 sessioninfo         1.2.2   2021-12-06 [1] CRAN (R 4.3.0)
 shiny               1.8.0   2023-11-17 [1] CRAN (R 4.3.1)
 stringi             1.8.3   2023-12-11 [1] CRAN (R 4.3.1)
 stringr             1.5.1   2023-11-14 [1] CRAN (R 4.3.1)
 urlchecker          1.0.1   2021-11-30 [1] CRAN (R 4.3.0)
 usethis             2.2.2   2023-07-06 [1] CRAN (R 4.3.0)
 UW561S2025Example * 0.1.0   2025-03-16 [1] local
 vctrs               0.6.5   2023-12-01 [1] CRAN (R 4.3.1)
 xtable              1.8-4   2019-04-21 [1] CRAN (R 4.3.0)

 [1] /Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library
```
