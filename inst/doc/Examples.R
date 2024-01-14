## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)

library(chronochrt)
library(knitr)

## ----setup, eval=FALSE--------------------------------------------------------
#  library(chronochrt)

## ----Example_UK, echo=TRUE, eval=FALSE----------------------------------------
#  # Data from St. Knöpke, Der urnenfelderzeitliche Männerfriedhof von Neckarsulm.
#  # Konrad Theiss Verlag (Stuttgart 2009), p. 15.
#  UC_Chronology <- import_chron(path = "ex_urnfield_periods.xlsx",
#                                 "Region", "Name", "Start", "End", "Level")

## ----Example_UK_hidden, echo=TRUE, message=FALSE------------------------------
UC_Chronology <- import_chron(path = system.file("extdata/ex_urnfield_periods.xlsx", package = 'chronochrt'),
                               "Region", "Name", "Start", "End", "Level")

## ----Example_UK_plot, eval=FALSE, echo=TRUE-----------------------------------
#   plot_chronochrt(UC_Chronology,
#                   axis_title = "BCE",
#                   size_text = 4,
#                   line_break = 22,
#                   filename = "UC-Chronology.png", plot_dim = c(16, 10, "cm"))
#  

## ----Example_UK_plot2, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
 plot_chronochrt(UC_Chronology, 
                 axis_title = "BCE", 
                 size_text = 4, 
                 line_break = 22)


## ----Example_London_hidden, echo=FALSE----------------------------------------
London_cemeteries <- import_chron(path = system.file("extdata/ex_London_cem.xlsx", package = 'chronochrt'),
                                  "Region", "Name", "Start", "End", "Level")

## ----Example_London, eval=FALSE, echo = TRUE----------------------------------
#  London_cemeteries <- import_chron(path = "ex_London_cem.xlsx", package = 'ChronochRt'),
#                                    "Region", "Name", "Start", "End", "Level")

## ----Example_London_labels, echo=TRUE-----------------------------------------
London_labels <-add_label_text(region = "low socio-economic status",
                               year = 1665,
                               label = "12.04.1665:\n The \"Great Plague of London\"\n begins",
                               position = 1.98, 
                               new = TRUE) %>%
               add_label_text(region = "urban",
                              year = c(1559, 1660, 1670),
                              label = c("1559: Coronation of Elizabeth I ", "1664: Sighting of a bright comet", "1666: Great Fire of London"),
                              position = 1.98,
                              new =  FALSE) %>% 
              add_label_text(region = "plague death toll",
                              year = c(1350, 1563, 1593, 1603, 1625, 1636, 1647, 1665),
                              label = c( "1346-1353: ~62,000","1563-1564: 20 136" , "1593: 15 003","1603: 33 347", "1625: 41,313", "1636: 10 000", "1647: 3,597" ,"1665: 68 596"),
                              position = 0.75,
                              new =  FALSE) 

## ----Example_London_plot, echo=TRUE, fig.align='center', fig.width=10, fig.height=6, message=FALSE, out.width="100%"----
 plot_chronochrt(data = London_cemeteries, 
                 labels_text = London_labels, 
                 size_text = 3, 
                 line_break = 25, 
                 color_line = "grey55")



