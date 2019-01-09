#' read all raw data in one file measured by LI-6800
#' @description help to read all raw data files with a command.
#'
#' @param file_dir is the file directory only contains all the measured
#' raw data.
#' @param data_start the start of your data(without headline)
#'
#' @examples
#' \dontrun{
#' library(readphoto)
#' read_bat_6800s('./6800')
#' }
#'
#' @export
#' 

read_bat_6800 <- function(file_dir, data_start = 56){
# use the first file's header as the colnames -----------------------------
  
  file_names <-  list.files(file_dir, full.names = TRUE)
  data_name <- read.delim(file_names[[1]], sep = "\t", skip = data_start-3)

# apply lyapply to cycle all the files ------------------------------------
  
  read_6800 <- match.fun("read_6800")
  data_list <- lapply(file_names, read_6800, data_start = data_start)
  df <- do.call("rbind", data_list)
  colnames(df) <- c(colnames(data_name), "files")
  df_name <- data.frame(files = df$files)
  df <- cbind(df_name, df[, -(ncol(df))])
  
  return(df)
}