% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_6800.R
\name{read_6800}
\alias{read_6800}
\title{Reads files from the LI-6800}
\usage{
read_6800(filename, data_start = 56)
}
\arguments{
\item{filename}{path and name of your data.}

\item{data_start}{the start of your data(without headline)}
}
\value{
read_6800 imports a LI-6800 raw data file as a data frame
}
\description{
\code{read_6800} Reads LI-6800 raw data files, which are delimited by tabs.
}
