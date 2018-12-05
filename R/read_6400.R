#' Reads files from the LI-6400
#'
#' \code{read_6400} Reads LI-6400 raw data files, which are delimited by tabs.
#'
#' @param filename path and name of your data.
#' @param data_start the start of your data(without headline)
#' @return read_6400 imports a LI-6400 raw data file as a data frame
#' @importFrom utils read.delim
#' @importFrom stringr str_split
#' @export

read_6400 <- function(filename, data_start = 27){
  
  data <- read.delim(filename, sep = "\t", skip = data_start - 1,
                     header = FALSE, fill = TRUE, stringsAsFactors = FALSE)
  # split with the / of directory path of filename
  rm_name <- str_split(filename, "\\/")
  # only use the last part of the split list, ie data file name
  data$files <- rep(tail(rm_name[[1]], 1), nrow(data))
  
  # Assign column names to data  -----------------------------
  return(data)
}
