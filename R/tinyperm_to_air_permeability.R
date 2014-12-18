#' Tinyperm value to air permeability conversion
#' 
#' Converts a value given by the TinyPerm II air permeameter into a value for air permeability
#' 
#' @param x TinyPerm II values
#' @param calibration Which calibration to use: Huysmans2008 or factory
#' 
#' @return Air permeability (m²)
#' @seealso \code{\link{tinyperm_to_hydraulic_conductivity}}, \code{\link{air_permeability_to_hydraulic_conductivity}}
#' @export
tinyperm_to_air_permeability <- function(x, calibration='Huysmans2008')
{
  if(calibration=='Huysmans2008')
  {
    y <- 10^((x - 12.8737)/(-0.8206))
    warning('If you are not using the device managed by prof. M. Huysmans with the custom filter, you need to change the calibration used in this function!')
  } else if(calibration=='factory')
  {
    y <- 10^((x - 12.967)/(-0.8386))
    warning('If you are not using the device managed by prof. M. Huysmans, you need to change the calibration used in this function!')
  } else {
    error('Please provide a correct reference for the calibration')
  }
  return(y*9.86923E-16)
}