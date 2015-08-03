#' Convert degree Fahrenheit to degree Kelvin
#' 
#' \code{fahrenheit_to_kelvin} converts a temperature value in degree Fahrenheit to degree Kelvin.
#' 
#' @param value Temperature (in degree Fahrenheit) value to convert to degree Kelvin
#' 
#' @return Temperature value in degree Kelvin
#' @seealso \code{\link{celsius_to_kelvin}}, \code{\link{celsius_to_fahrenheit}}, \code{\link{kelvin_to_celsius}}, \code{\link{kelvin_to_fahrenheit}}, \code{\link{fahrenheit_to_celsius}}
#' @export
fahrenheit_to_kelvin <- function(value) return((value+459.67)*5/9)