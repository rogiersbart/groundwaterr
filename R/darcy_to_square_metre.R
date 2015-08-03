#' Convert darcy units to square metre
#' 
#' \code{darcy_to_square_metre} converts a permeability value in darcy units to square metre.
#' 
#' @param value Permeability (in darcy units) value to convert to square metre
#' 
#' @return Permeability value in square metre
#' @seealso \code{\link{square_metre_to_darcy}}
#' @export
darcy_to_square_metre <- function(value) return(value*9.869233e-13)