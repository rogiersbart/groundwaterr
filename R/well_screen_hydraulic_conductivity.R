#' Well screen hydraulic conductivity
#' 
#' \code{function} description
#' 
#' @param param explanation
#' 
#' @return Returned value
#' @details More detailed explanation
#' @seealso \code{\link{related_function}}
#' @export
well_screen_hydraulic_conductivity <- function(r_s, r_f, slot_area, slot_perimeter, slot_screen_area_ratio, slot_resistance_coef=12, mu=1.308,rho=999.7,g=9.80665,t=10)
{
  if(t!=10 & mu==1.308E-3 & rho==999.7)
  {
    tVector <- c(0,5,10,20,30,40,50,60,70,80,90,100)
    rhoVector <- c(999.8,1000,999.7,998.2,995.7,992.2,988.1,983.2,977.8,971.8,965.3,958.4)
    muVector <- c(1.787,1.519,1.307,1.002,0.798,0.653,0.547,0.467,0.404,0.355,0.315,0.282)
    mu <- approx(x=tVector,y=muVector,xout=t)$y
    rho <- approx(x=tVector,y=rhoVector,xout=t)$y
  }
  r_H <- 2 * (slot_area / slot_perimeter) # hydraulic radius of the slot
  return( (slot_screen_area_ratio*r_H^2*rho*g) / (slot_resistance_coef*well_screen_resistance(r_s, r_f, slot_area, slot_perimeter)*mu) ) # well screen hydraulic conductivity
}
