#' Well flow distortion factor
#' 
#' \code{function} description
#' 
#' @param param explanation
#' @param equation 'Halevy', 'Ogilvi', or 'Bidaux and Tsang'
#' 
#' @return Returned value
#' @details More detailed explanation
#' @seealso \code{\link{related_function}}
#' @export
well_flow_distortion_factor <- function(r_s,r_f,r_a,K_s,K_f,K_a, equation='Halevy',recursion_level=100)
{
  if(equation=='Halevy')
  {
    alpha <- 8*1/((1+K_a/K_f)*(1+(r_s/r_f)^2+(K_f/K_s)*(1-(r_s/r_f)^2)) + (1-K_a/K_f)*((r_s/r_a)^2 + (r_f/r_a)^2  + (K_f/K_s)*((r_s/r_a)^2-(r_f/r_s)^2) ))
  } else if(equation=='Ogilvi')
  {
    alpha <- 4/( (1+(r_s/r_a)^2) + K_a/K_s* (1+(r_s/r_a)^2))
  } else if(equation=='Bidaux and Tsang')
  {
    g <- 1/log(r_a/r_s)
    eta <- 1
    denominator <- eta
    for(n in 1:recursion_level)
    {
      eta <- eta * ((1/g + n -1)/(n*(2/g + n)))
      denominator <- denominator + eta*(-log(K_s/K_a))^n
      #print(denominator)
    }
    alpha <- 2/denominator
  } else stop('Provide one of the following equations: Havely, Ogilvi or Bidaux and Tsang.')
  return(alpha)
}