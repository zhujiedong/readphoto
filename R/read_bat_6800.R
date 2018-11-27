#' read all raw data in one file measured by LI-6800
#' @description help to read all raw data files with a command.
#'
#' @param file_dir is the file directory only contains all the measured
#' raw data.
#' @param skiplines the start of your data(headline)
#'
#' @examples
#' \dontrun{
#' library(readphoto)
#' read_bat_6800s('./6800')
#' }
#'
#' @export
#' 

read_bat_6800 <- function(file_dir, skiplines = 53){
  file_names <-  list.files(file_dir, full.names = TRUE)
  data_name <- read.delim(file_names[[1]], sep = "\t", skip = skiplines)
  read_6800 <- match.fun("read_6800")
  data_list <- lapply(file_names, read_6800, skiplines = skiplines)
  df <- do.call("rbind", data_list)
  colnames(df) <- colnames(data_name)
  return(df)
}