#' Convert inch to metre
#' 
#' \code{inch_to_metre} converts a length in inches to metres.
#' 
#' @param value Length (in inches) to convert to metres
#' 
#' @return Length in metres
#' @export
inch_to_metre <- function(value) return(value/0.3937008/100)
