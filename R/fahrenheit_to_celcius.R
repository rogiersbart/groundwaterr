#' Convert degree Fahrenheit to degree Celsius
#' 
#' \code{kelvin_to_celsius} converts a temperature value in degree Fahrenheit to degree Celsius.
#' 
#' @param value Temperature (in degree Fahrenheit) value to convert to degree Celsius
#' 
#' @return Temperature value in degree Celsius
#' @seealso \code{\link{celsius_to_kelvin}}, \code{\link{celsius_to_fahrenheit}}, \code{\link{kelvin_to_celsius}}, \code{\link{kelvin_to_fahrenheit}}, \code{\link{fahrenheit_to_kelvin}}
#' @export
fahrenheit_to_celcius <- function(value) return((value-32)*5/9)