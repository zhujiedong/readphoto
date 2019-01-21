#' read all excel data in one file measured by LI-6800
#' @description help to read all excel data files with a command.
#'
#' @param file_dir is the file directory only contains all the measured
#' excel data.
#' @param data_start the start of your data(without headline)
#' @importFrom readxl read_excel
#' @examples
#' \dontrun{
#' library(readphoto)
#' read_bat_6800s('./6800')
#' }
#'
#' @export
#' 

readxl_bat_6800 <- function(file_dir, data_start = 41){
  # use the first file's header as the colnames -----------------------------
  
  file_names <-  list.files(file_dir, full.names = TRUE)
  data_name <- read_excel(file_names[[1]], skip = data_start-3)
  
  # apply lyapply to cycle all the files ------------------------------------
  
  readxl_6800 <- match.fun("readxl_6800")
  data_list <- lapply(file_names, readxl_6800, data_start = data_start)
  df <- do.call("rbind", data_list)
  colnames(df) <- c(colnames(data_name), "files")
  df_name <- data.frame(files = df$files)
  df <- cbind(df_name, df[, -(ncol(df))])
  
  return(df)
}