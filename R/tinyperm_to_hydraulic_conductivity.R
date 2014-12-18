#' Tinyperm value to hydraulic conductivity conversion
#' 
#' Converts a value given by the TinyPerm II air permeameter into a value for hydraulic conductivity
#' 
#' @param x TinyPerm II values
#' @param calibration Which calibrations to use: see details.
#' 
#' @return Hydraulic conductivity (m/s)
#' @details \code{calibration} is a vector of two strings, with the first element Huysmans2008 or factory, and the second element Iversen2003 or Loll1999
#' @seealso \code{\link{tinyperm_to_air_permeability}}, \code{\link{air_permeability_to_hydraulic_conductivity}}
#' @export
tinyperm_to_hydraulic_conductivity <- function(x, calibration=c('Huysmans2008','Iversen2003'))
{
  return(air_permeability_to_hydraulic_conductivity(tinyperm_to_air_permeability(x,calibration[1]),calibration[2]))
}