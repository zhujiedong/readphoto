#' Reads files from the LI-6800
#'
#' \code{read_6800} Reads LI-6800 raw data files, which are delimited by tabs.
#'
#' @param filename path and name of your data.
#' @return read_6800 imports a LI-6800 raw data file as a data frame
#' @export

regex_read <- function(filename){
  
  raw68 <- readLines(filename)
  pattern <- "^\\[Header\\](\\s|\\S)+(\\[Data\\])"
  rawone <- stringi::stri_flatten(raw68, collapse = '\n')
  
  # data start with [Data], header between [Header] and [Data]
  header <- stringi::stri_extract_all(rawone, regex = pattern)
  data_meas <- stringi::stri_split(rawone, regex = pattern,
                                   omit_empty = TRUE)
  
  data_temp <- stringi::stri_split(data_meas,regex = "\n", simplify = TRUE)
  data_temp <- t(data_temp)
  
  data_name <- readr::read_tsv(data_temp, skip = 2)
  data_noname <- readr::read_tsv(data_temp, skip = 4, col_names = names(data_name))
  data_noname$file_name <- filename
  
  return(data_noname)
}