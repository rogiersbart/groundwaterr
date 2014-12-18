#' Point dilution method
#' 
#' Provides the apparent specific discharge from a dilution curve.
#' 
#' @param conc Concentration vector
#' @param time Time vector
#' @param conc_init Initial concentration
#' @param conc_final Final concentration (background)
#' @param time_init Starting time of the point dilution test
#' @param time_final Ending time of the point dilution test
#' @param well_diam Well diameter
#' @param well_head Water column height inside the well
#' @param filter_length Length of the filter
#' @param hose_diam Diameter of the recirculation hose
#' @param hose_length Length of the hose outside of the water column
#' 
#' @return Apparent specific discharge (length/time)
#' @details To obtain the specific discharge, the apparent specific discharge should be divided by the flow distortion factor.
#' @seealso \code{\link{well_flow_distortion_factor}}
#' @export
point_dilution_method <- function(conc,time,conc_init,conc_final,time_init,time_final,well_diam,well_head,filter_length,hose_diam=0.0127,hose_length=10)
{
  conc <- ((conc-conc_final)/(conc_init-conc_final))[which(time >= time_init & time <= time_final)]
  time <- time[which(time >= time_init & time <= time_final)]
  time <- (as.numeric(time)-as.numeric(time_init))
  V <- (pi*well_head*(well_diam/2)^2) + (pi*(hose_diam/2)^2*hose_length)
  A <- well_diam*filter_length
  linmod <- lm(log(conc)~time)
  return(data.frame(q=as.numeric(-coef(linmod)[2] *V/A),stdev=sqrt(diag(vcov(linmod))[2])*V/A))
}