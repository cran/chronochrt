
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ChronochRt

<!-- badges: start -->

[![pipeline
status](https://gitlab.com/roset/chronochrt/badges/master/pipeline.svg)](https://gitlab.com/roset/chronochrt/-/commits/master)
[![coverage
report](https://gitlab.com/roset/chronochrt/badges/master/coverage.svg)](https://gitlab.com/roset/chronochrt/-/commits/master)
<!-- badges: end -->

ChronochRt offers an easy way to draw chronological charts from tables.
It aims to provide an intuitive environment for anyone new to R and
includes [ggplot2](https://ggplot2.tidyverse.org/) geoms and theme for
chronological charts.

## Installation

ChronochRt is currently in the state of beta testing. You can install it
from gitlab by:

``` r
 devtools::install_gitlab("roset/chronochrt")
```

and to include the vignette

``` r
 devtools::install_gitlab("roset/chronochrt", build_vignettes = TRUE)
```

Please help us to improve ChronochRt by filing observed bugs as an issue
[here](mailto:incoming+roset-chronochrt-13993341-issue-@incoming.gitlab.com).

## Features

-   Slim structure of chronological datasets
-   Import tabular data files
-   Import Excel files (requires the package
    [readxl](https://readxl.tidyverse.org/))
-   Possibility to display up to 2 chronological systems within the same
    region (e.g. long and short chronologies)
-   Layout of the chronological chart optimised for easy readability and
    comprehensibility
-   Years in BCE must be negative - that’s all you need to care about
    dates
-   Handling of insecure dates
-   Handling of gaps, e.g. abandonment phases of sites
-   Optional text labels
-   Optional image labels to e.g. display key finds or show typological
    developments
-   Geoms for the chronological chart and image labels
-   Export of the chronological chart in different file formats (raster
    and vector graphics)
-   Easy customisation of the chronological chart
-   Based on the [tidyverse](https://www.tidyverse.org/): Seamless
    integration in pipes, enhanced customisation with
    [ggplot2](https://ggplot2.tidyverse.org/)

Is there a feature missing? Please let us know
[here](mailto:incoming+roset-chronochrt-13993341-issue-@incoming.gitlab.com).

## Example

``` r
library(ChronochRt)

data <- add_chron(region = "A",
                  name = c("A", "A1", "A2", "B"),
                  start = c(-200, -200, 0, -100),
                  end = c(200, 0, 200, 100),
                  level = c(1,2,2,1),
                  add = FALSE,
                  new_table = TRUE)

plot_chronochrt(data)
```

## Getting started

-   [Cheatsheet](https://gitlab.com/roset/chronochrt/-/raw/master/inst/ChronochRt_Cheatsheet.pdf?inline=false)
-   [Vignettes](https://gitlab.com/roset/chronochrt/-/tree/master/vignettes)

## Funding for the development of ChronochRt 0.0.5

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody>
<tr>
<td valign="bottom">
<img src="https://europa.eu/european-union/sites/europaeu/files/docs/body/flag_yellow_low.jpg"  width="200">
</td>
<td valign="bottom" halign="left">
This project has received funding from the European Union’s Horizon 2020
research and innovation programme under the Marie Skłodowska-Curie grant
agreement No 766311.
</td>
</tr>
</tbody>
</table>
