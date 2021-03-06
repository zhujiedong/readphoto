% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recomp_6800.R
\name{recomp_6800}
\alias{recomp_6800}
\title{recompute the raw data in one file measured by LI-6800}
\usage{
recomp_6800(file_dir, S = 6, K = 0.5)
}
\arguments{
\item{file_dir}{is the file directory only contains all the measured
raw data.}

\item{S}{area of the leaf measured}

\item{K}{stomatal ratio}
}
\description{
help to read all raw data files with a command.
}
\examples{
\dontrun{
library(readphoto)
recomp_6800('./6800')
}

}
