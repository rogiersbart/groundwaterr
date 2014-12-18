#' Air permeability to hydraulic conductivity conversion
#' 
#' Converts an air permeability value into a value for hydraulic conductivity
#' 
#' @param x air permeability values (m²)
#' @param calibration Which calibration to use: Iversen2003 or Loll1999
#' 
#' @return Hydraulic conductivity (m/s)
#' @seealso \code{\link{tinyperm_to_hydraulic_conductivity}}, \code{\link{tinyperm_to_air_permeability}}
#' @export
air_permeability_to_hydraulic_conductivity <- function(x, calibration='Iversen2003')
{
  if(calibration=='Iversen2003')
  {
    y <- (10^(1.22*log10(x)+13.93))/86400
  } else if(calibration=='Loll1999')
  {
    y <- (10^(1.27*log10(x)+14.11))/86400
  } else {
    error('Please provide a correct reference for the calibration')
  }
  return(y)
}