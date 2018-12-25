#' read all raw data in one file measured by LI-6400
#' @description help to read all raw data files with a command.
#'
#' @param file_dir is the file directory only contains all the measured
#' raw data.
#' @param data_start the start of your data(without headline)
#' @param header_line ther start of your data with header.
#'
#' @examples
#' \dontrun{
#' library(readphoto)
#' read_bat_6400s('./6400')
#' }
#'
#' @export
#' 

read_bat_6400 <- function(file_dir, header_line = 17, data_start = 27){

# use the first file's header as the colnames -----------------------------
  
  file_names <-  list.files(file_dir, full.names = TRUE)
  data_name <- read.delim(file_names[[1]], sep = "\t", skip = header_line - 1)

# apply lyapply to cycle all the files ------------------------------------
  
  read_6400 <- match.fun("read_6400")
  data_list <- lapply(file_names, read_6400, data_start = data_start)
  df <- do.call("rbind", data_list)
  colnames(df) <- c(colnames(data_name), "files")
  df <- df[which(df$FTime>0), ]
  df_name <- data.frame(files = df$files)
  df <- cbind(df_name, df[, -(ncol(df))])
  return(df)
}