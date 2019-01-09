#' recompute the raw data in one file measured by LI-6800
#' @description help to read all raw data files with a command.
#'
#' @param file_dir is the file directory only contains all the measured
#' raw data.
#' @param data_start the start of your data(without headline)
#' @param S area of the leaf measured
#' @param K stomatal ratio
#' 
#' @examples
#' \dontrun{
#' library(readphoto)
#' recomp_6800('./6800')
#' }
#'
#' @export
#' 
recomp_6800 <- function(file_dir,data_start = 56, S = 6, K = 0.5){
  
  read_bat_6800 <- match.fun(read_bat_6800) 
  
  df <- read_bat_6800(file_dir,data_start = data_start)
   # transpiration -----------------------------------------------------------
  
  df$E = df$CorrFact * df$Flow * (df$H2O_s - df$H2O_r) / (100 * S *(1000 - df$CorrFact * df$H2O_s))
  
  # assimilation ------------------------------------------------------------
  
  df$A = df$Flow*df$CorrFact*(df$CO2_r-df$CO2_s*(1000-df$CorrFact*df$H2O_r)/(1000-df$CorrFact*df$H2O_s))/(100*S)
  
  # gbw ---------------------------------------------------------------------
  
  df$gbw=df$blfa_3+df$blfa_2*S+df$blfa_1*S*S
  
  # gtw ---------------------------------------------------------------------
  
  df$gtw=df$E*(1000-(1000*0.61365*exp(17.502*df$TleafCnd/(240.97+df$TleafCnd))/(df$Pa+df$VPcham)+df$H2O_s)/2)/(1000*0.61365*exp(17.502*df$TleafCnd/(240.97+df$TleafCnd))/(df$Pa+df$VPcham)-df$H2O_s)
  
  # gsw ---------------------------------------------------------------------
  
  df$gsw = 2/((1/df$gtw-1/df$gbw)+sqrt((1/df$gtw-1/df$gbw)*(1/df$gtw-1/df$gbw) + 4*K/((K+1)*(K+1))*(2*1/df$gtw*1/df$gbw-1/df$gbw*1/df$gbw)))
  
  # gtc ---------------------------------------------------------------------
  
  df$gtc=1/((K+1)/(df$gsw/1.6)+1/(df$gbw/1.37)) + K/((K+1)/(df$gsw/1.6) + K/(df$gsw/1.37))
  
  # ci ----------------------------------------------------------------------
  df$Ci=((df$gtc-df$E/2)*df$Ca-df$A)/(df$gtc+df$E/2)
  
  return(df)
}  
