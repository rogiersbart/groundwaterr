#' Convert hydraulic conductivity to permeability
#' 
#' Converts a hydraulic conductivity value to a value for intrinsic permeability.
#' 
#' @param K Hydraulic conductivity of the medium (m/s)
#' @param mu Dynamic viscosity of the fluid; defaults to 1.308E-3 Pa*s
#' @param rho Density of the fluid; defaults to 999.7 kg/m³
#' @param g Gravitational acceleration; defaults to 9.80665 m/s²
#' @param t Temperature; defaults to 10°C
#' 
#' @return Intrinsic permeability value
#' @details \code{mu} and \code{rho} are automatically determined in function of t in a temperature range between 0 and 100 °C, unless the values are explicitely specified.
#' @seealso \code{\link{permeability_to_hydraulic_conductivity}}
#' @export
hydraulic_conductivity_to_permeability <- function(K,mu=1.308E-3,rho=999.7,g=9.80665,t=10)
{
  if(t!=10 & mu==1.308E-3 & rho==999.7)
  {
    tVector <- c(0,5,10,20,30,40,50,60,70,80,90,100)
    rhoVector <- c(999.8,1000,999.7,998.2,995.7,992.2,988.1,983.2,977.8,971.8,965.3,958.4)
    muVector <- c(1.787,1.519,1.307,1.002,0.798,0.653,0.547,0.467,0.404,0.355,0.315,0.282)*10^(-3)
    mu <- approx(x=tVector,y=muVector,xout=t)$y
    rho <- approx(x=tVector,y=rhoVector,xout=t)$y
  }
  return(K*mu/(rho*g))
}