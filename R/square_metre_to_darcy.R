#' Convert square metre to darcy units
#' 
#' \code{square_metre_to_darcy} converts a permeability value in square metre to darcy units.
#' 
#' @param value Permeability (in square metre) value to convert to darcy units
#' 
#' @return Permeability value in darcy units
#' @seealso \code{\link{darcy_to_square_metre}}
#' @export
square_metre_to_darcy <- function(value) return(value/9.869233e-13)