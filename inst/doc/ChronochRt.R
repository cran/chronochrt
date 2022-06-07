## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(chronochrt)
library(ggplot2)
library(knitr)

## ----setup, eval=FALSE--------------------------------------------------------
#  library(chronochrt)

## ----plot_structure_data, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
chrons <- add_chron(
  region = c("region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = A", "region = B", "region = B", "region = B"),
  name = c("level = 1\nadd =\nFALSE", "level = 2\nadd =\nFALSE", "level = 3\nadd =\nFALSE", "level = 4\nadd =\nFALSE", "level = 5\nadd =\nFALSE","level = 1\nadd =\nTRUE","level = 2\nadd =\nTRUE","level = 2\nadd =\nTRUE", "add =\nTRUE", "level = 3", "add = TRUE", "level = 4", "level = 1\nadd = FALSE", "level = 2\nadd = FALSE", "level = 3\nadd = FALSE"),  
  start = c(-500, -500, -500, -500, -500, -400, -400, 0, 0, "200/200", "200/200", "275_325", -500, -500, -500), 
  end = c(500, 500, 500, 500, 500, 400, -50, 400, "200/200", 400, "275_325", 400, 500, 500, 500), 
  level = c(1, 2, 3, 4, 5, 1, 2, 2, 3, 3, 4, 4, 1, 2, 3), 
  add = c(FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE), 
  new_table = TRUE) 

# How does it look like? 
print(chrons)


## ----plot_structure_plot, echo=FALSE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----

plot_chronochrt(chrons, size_text = 4, line_break = 20) + 
  ggplot2::scale_x_continuous(name = NULL, breaks = seq(0, 2, 0.1), minor_breaks = NULL, expand = c(0,0)) + 
  ggplot2::theme(axis.text.x = ggplot2::element_text(),
        axis.ticks.x = ggplot2::element_line())


## ----unclear, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----

data <- add_chron(region = "earlier/later", 
                  name = c("1", "2", "1a", "1b"), 
                  start = c(-100, "50/100", -100, "-25_25"), 
                  end = c("50/100", 200, "-25_25", "50/100"), 
                  level = c(1, 1, 2, 2),
                  add = FALSE,
                  new_table = TRUE) %>%
  add_chron(region = "later/earlier", 
            name = c("1", "2", "1a", "1b"), 
            start = c(-100, "100/50", -100, "25_-25"), 
            end = c("100/50", 200, "25_-25", "100/50"), 
            level = c(1, 1, 2, 2),
            add = FALSE,
            new_table = FALSE) %>%
  add_chron(region = "mixed", 
            name = c("1", "2", "1a", "1b"), 
            start = c(-100, "50/100", -100, "-25_25"), 
            end = c("50/100", 200, "25_-25", "100/50"), 
            level = c(1, 1, 2, 2),
            add = FALSE,
            new_table = FALSE) %>%
  add_chron(region = "same", 
            name = c("1", "2", "1a", "1b"), 
            start = c(-100, "100/100", -100, "25_25"), 
            end = c("100/100", 200, "25_25", "100/100"), 
            level = c(1, 1, 2, 2),
            add = FALSE,
            new_table = FALSE) %>%
  arrange_regions(order = c("earlier/later", "later/earlier", "same", "mixed"))

plot_chronochrt(data)


## ----label, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----

text <- add_label_text(region = "earlier/later", 
                       year = 50, 
                       position = 0.95, 
                       label = "This date in front of the /.", 
                       new = TRUE)

text <- add_label_text(data = text, 
                       region = "later/earlier", 
                       year = 100, 
                       position = 0.9, 
                       label = "This date in\nfront of the /.", 
                       new = FALSE) %>%
  add_label_text(region = "mixed", 
                 year = 75, 
                 position = 0.75, 
                 label = "Both dates are\nin front of the /.", 
                 new = FALSE)

text <- add_label_text(data = text, 
                       region = "same", 
                       year = 100, 
                       position = c(0.4, 0.9), 
                       label = "same", new = FALSE)

plot_chronochrt(data, labels_text = text)

## ----label2, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----

image <- add_label_image(region = "earlier/later", 
                         year = 50, 
                         position = 0.5, 
                         image_path = "https://www.r-project.org/logo/Rlogo.png", 
                         new = TRUE) %>%
  add_label_image(region = "same", 
                  year = 0,
                  position = 0.5,
                  image_path = "https://www.r-project.org/logo/Rlogo.svg", 
                  new = FALSE)

plot_chronochrt(data, labels_image = image)

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  
#  plot_chronochrt(chrons, size_chrons = 4, line_break = 20) +
#    ggplot2::scale_x_continuous(name = NULL, breaks = seq(0, 2, 0.1), minor_breaks = NULL, expand = c(0,0)) +
#    ggplot2::theme(axis.text.x = ggplot2::element_text(),
#          axis.ticks.x = ggplot2::element_line())
#  

## ----eval=FALSE, include=FALSE------------------------------------------------
#  library(ggplot2)
#  library(ChronochRt)
#  
#  ggplot() +
#    geom_chronochRt(data = data, mapping = aes(region = region, name = name, start = start, end = end, level = level, add = add)) +
#    geom_text(data = label, aes(x = position, y = year, label = label)) +
#    geom_chronochRtImage(data = image, aes(x = position, y = year, image_path = image_path)) +
#    facet_grid(cols = vars(region), scales = "free_x", space = "free_x")

## ----advanced1, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
plot <- ggplot() + 
  geom_chronochRt(data = data, mapping = aes(region = region, name = name, start = start, end = end, level = level, add = add)) + 
  geom_text(data = text, aes(x = position, y = year, label = label)) +
  geom_chronochRtImage(data = image, aes(x = position, y = year, image_path = image_path)) + 
  facet_grid(cols = vars(region))

plot

## ----advanced2, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
plot + theme_chronochrt()

## ----advanced3, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
ggplot() + 
  geom_chronochRt(data = chrons, mapping = aes(region = region, name = name, start = start, end = end, level = level, add = add)) + 
  facet_grid(cols = vars(region)) + 
  theme_chronochrt()

## ----advanced4, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
ggplot() + 
  geom_chronochRt(data = chrons, mapping = aes(region = region, name = name, start = start, end = end, level = level, add = add)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(name = "Year", expand = c(0,0)) +
  facet_grid(cols = vars(region), scales = "free_x", space = "free_x") + 
  theme_chronochrt()

## ----advanced5, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
ggplot() + 
  geom_chronochRt(data = data, mapping = aes(region = region, name = name, start = start, end = end, level = level, add = add)) + 
  geom_text(data = text, aes(x = position, y = year, label = label)) +
  geom_chronochRtImage(data = image, aes(x = position, y = year, image_path = image_path)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(name = "Year", expand = c(0,0)) +
  facet_grid(cols = vars(region), scales = "free_x", space = "free_x") + 
  theme_chronochrt()

## ----advanced6, echo=TRUE, fig.align='center', fig.width=10, message=FALSE, out.width="100%"----
points <- data.frame(x = seq(0, 2, 0.5), 
                     y = seq(-500,-100, 100))

ggplot() + 
  geom_chronochRt(data = chrons, aes(region = region, name = NULL, start = start, end = end, level = level, add = add)) + 
  geom_point(data = points, aes(x = x, y = y), size = 5, colour = "red") + 
  facet_grid(cols = vars(region), scales = "free_x", space = "free_x") + 
  theme_void()

