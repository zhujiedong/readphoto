#' Reads files from the LI-6800
#'
#' \code{read_6800} Reads LI-6800 raw data files, which are delimited by tabs.
#'
#' @param filename path and name of your data.
#' @param data_start the start of your data(without headline)
#' @return read_6800 imports a LI-6800 raw data file as a data frame
#' @importFrom utils read.delim
#' @importFrom stringr str_split
#' @importFrom utils tail
#' @export

read_6800 <- function(filename, data_start = 56){

# only read measured data -------------------------------------------------

  data <- read.delim(filename, sep = "\t", skip = data_start-1,
                     header = FALSE, fill = TRUE, stringsAsFactors = FALSE)
  # split with the / of directory path of filename
  rm_name <- str_split(filename, "\\/")
  # only use the last part of the split list, ie data file name
  data$files <- rep(tail(rm_name[[1]], 1), nrow(data))

  # Assign column names to data  -----------------------------
  return(data)
}
