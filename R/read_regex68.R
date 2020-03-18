#' read all raw data in one file measured by LI-6800
#' @description help to read all raw data files with a command.
#'
#' @param file_dir is the file directory only contains all the measured
#' raw data.
#'
#' @examples
#' \dontrun{
#' library(readphoto)
#' read_regex('./6800')
#' }
#'
#' @export
#' 

read_regex68 <- function(file_dir){
  # use the first file's header as the colnames -----------------------------
  
  file_names <-  list.files(path = file_dir, full.names = TRUE)
  match.fun("regex_read")
 
  # apply lyapply to cycle all the files ------------------------------------
  
  data_list <- lapply(file_names, regex_read)
  df <- do.call("rbind", data_list)

  return(df)
}




