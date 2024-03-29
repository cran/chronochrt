% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chronochrt_geom.R
\name{geom_chronochRt}
\alias{geom_chronochRt}
\title{A chronological chart}
\usage{
geom_chronochRt(
  mapping = NULL,
  data = NULL,
  inherit.aes = TRUE,
  year_lim = NULL,
  minimal = FALSE,
  ...
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}}. If specified and
\code{inherit.aes = TRUE} (the default), it is combined with the default mapping
at the top level of the plot. You must supply \code{mapping} if there is no plot
mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}

\item{year_lim}{A numeric vector of length 2 to define the lower and upper
limit of the chronological chart.}

\item{minimal}{Should chrons be optically separated by vertical lines? If
\code{TRUE} only vertical lines between around the chronological columns
will be drawn.}

\item{...}{Other arguments passed on to \code{\link[ggplot2]{layer}}. These
are often aesthetics, used to set an aesthetic to a fixed value, like
\code{hjust = 0.1}.}
}
\value{
Layer of a ggplot2 object.
}
\description{
Computes and draws a chronological chart.
}
\details{
This geom is special because no x and y coordinates are
provided in the input. Therefore, the following aesthetics must be provided
only in the \code{\link[ggplot2]{aes}} function: \code{region}, \code{level},
\code{start}, \code{end}, \code{add} (i.e. all required aesthetics).
\itemize{ \item \code{region} The title(s) of the section(s) the
chronological chart is subdivided into \item \code{name} The name(s) of the
chronological unit(s). To maintain compatibility with other geoms, the
aesthetic \code{label} can be used instead. \item \code{start, end} The start
and end date of a chronological unit, respectively. \item \code{level} The
levels of the chronological units. \item \code{add} Logical value indicating
whether chronological units within a \code{region} should be plotted in an
\emph{add}itional column.}

Usually, the names of the chronological units are placed in their middle.
They can be arbitrarily placed by the aesthetics \code{name_x, name_y}:
\itemize{ \item \code{name_x} The horizontal position within an chronological
column, i.e. a value between 0 and 1 if \code{add = FALSE} and between 1 and
2 if \code{add = TRUE}. \item \code{name_y} The vertical position given as a
year.}

See \code{vignette("ChronochRt")} below for further details.

The geom aims to preserve access to as much of the underlying aesthetics as
possible. To achieve this aim, ambiguous names were resolved (e.g.
\code{size} to \code{size_line} and \code{size_text}).
}
\section{Aesthetics}{
 \code{geom_ChronochRt()} understands the following
  aesthetics (required aesthetics are in bold): \itemize{ \item
  \strong{\code{region}} \item \strong{\code{level}} \item
  \strong{\code{end}} \item \strong{\code{start}} \item \strong{\code{add}}
  \item \code{alpha} \item \code{angle} \item \code{colour} \item
  \code{family} \item \code{fill} \item \code{fontface} \item \code{group}
  \item \code{hjust} \item \code{lineheight} \item \code{name|label} \item
  \code{name_x} \item \code{name_y} \item \code{size_line} \item
  \code{size_text} \item \code{vjust} } See Details for how aesthetics
  specific for this geom work and learn more about setting aesthetics in
  \code{vignette("ggplot2-specs")}.
}

\examples{

# Create example data
library(ggplot2)

chrons <- data.frame(region = c("A", "B", "B", "B", "A"),
                     name = c("a", "a", "1", "2", "b"),
                     start = c(-100, -100, -100, "0/50", "50_100"),
                     end = c("50_100", 150, "0/50", 150, 200),
                     level = c(1, 1, 2, 2, 1),
                     add = FALSE)

ggplot(chrons) +
geom_chronochRt(aes(name = name, region = region, level = level,
                    start = start, end = end, add = add))

ggplot(chrons, aes(name = name, region = region, level = level,
                   start = start, end = end, add = add)) +
   geom_chronochRt()

# If more than one region should be plotted, they must be separated with facet_grid:
ggplot(chrons) +
   geom_chronochRt(aes(name = name, region = region, level = level,
                       start = start, end = end, add = add)) +
   facet_grid(cols = vars(region), scales = "free_x", space = "free_x")

# Adjust upper and lower end of a chronological chart with year_lim:
q <- ggplot(chrons, aes(name = name, region = region, level = level,
                        start = start, end = end, add = add)) +
   facet_grid(cols = vars(region), scales = "free_x", space = "free_x")

q + geom_chronochRt(year_lim = c(-50, 100))

# Change aesthetics of the plot:
q + geom_chronochRt(fill = "black", colour = "white")
q + geom_chronochRt(aes(fill = level, size_line = 3))

# Change position of the names:
q + geom_chronochRt(aes(name_x = 0.75))

# To remove vertical lines within a chronological column:
q + geom_chronochRt(minimal = TRUE)
}
