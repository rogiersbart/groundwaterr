#' Convert degree Celsius to degree Kelvin
#' 
#' \code{celsius_to_kelvin} converts a temperature value in degree Celsius to degree Kelvin.
#' 
#' @param value Temperature (in degree Celsius) value to convert to degree Kelvin
#' 
#' @return Temperature value in degree Kelvin
#' @seealso \code{\link{kelvin_to_celsius}}
#' @export
celcius_to_kelvin <- function(value) return(value+273.15)