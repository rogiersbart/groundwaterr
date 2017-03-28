#' Well screen resistance
#' 
#' \code{well_screen_resistance} provides the 
#' 
#' @param r_s inner diameter of well screen (mm)
#' @param r_f outer diameter of well screen (mm)
#' @param slot_area area of the slot (mm²)
#' @param slot_perimeter (mm)
#' 
#' @return Returned value
#' @details More detailed explanation
#' @references Drost et al. (1968)
#' Palmer (1993)
#' @seealso \code{\link{well_screen_hydraulic_conductivity}}
#' \code{\link{well_flow_distortion_factor}}
#' @export
well_screen_resistance <- function(r_s, r_f, slot_area, slot_perimeter)
{
  r_H <- 2 * (slot_area / slot_perimeter) # hydraulic radius of the slot
  # return((10 ^ (3.828+2.055 * log10(r_H / r_f)))/(50 / (r_s + r_f))^2) # previous version, seems not to be correct
  return(10 ^ (5.3 * log10(r_H / r_f) + 11.077 - log10(50 / (r_s + r_f)))) # well screen resistance
}
