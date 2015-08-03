#' Convert degree Kelvin to degree Fahrenheit
#' 
#' \code{kelvin_to_celsius} converts a temperature value in degree Kelvin to degree Fahrenheit.
#' 
#' @param value Temperature (in degree Kelvin) value to convert to degree Fahrenheit
#' 
#' @return Temperature value in degree Fahrenheit
#' @seealso \code{\link{celsius_to_kelvin}}, \code{\link{celsius_to_fahrenheit}}, \code{\link{kelvin_to_celsius}}, \code{\link{fahrenheit_to_celsius}}, \code{\link{fahrenheit_to_kelvin}}
#' @export
kelvin_to_fahrenheit <- function(value) return(value*9/5-459.67)