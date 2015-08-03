#' Convert degree Kelvin to degree Celsius
#' 
#' \code{kelvin_to_celsius} converts a temperature value in degree Kelvin to degree Celsius.
#' 
#' @param value Temperature (in degree Kelvin) value to convert to degree Celsius
#' 
#' @return Temperature value in degree Celsius
#' @seealso \code{\link{celsius_to_kelvin}}, \code{\link{celsius_to_fahrenheit}}, \code{\link{kelvin_to_fahrenheit}}, \code{\link{fahrenheit_to_celsius}}, \code{\link{fahrenheit_to_kelvin}}
#' @export
kelvin_to_celsius <- function(value) return(value-273.15)