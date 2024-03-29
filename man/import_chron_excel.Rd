% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chronochrt_import.R
\name{import_chron_excel}
\alias{import_chron_excel}
\title{Import chronological information from excel files}
\usage{
import_chron_excel(path, ...)
}
\arguments{
\item{path}{A character string with the path of the file to be imported.}

\item{...}{Additional arguments inherited from \code{\link[readxl]{read_excel}}.}
}
\value{
A tibble containing the chronological information.
}
\description{
This function imports and converts chronological information saved in
\code{.xls} or \code{.xslx} into a ready-to-plot data set. Missing values
will be substituted by "!".
}
\keyword{internal}
