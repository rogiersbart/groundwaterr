% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/air_permeability_to_hydraulic_conductivity.R
\name{air_permeability_to_hydraulic_conductivity}
\alias{air_permeability_to_hydraulic_conductivity}
\title{Air permeability to hydraulic conductivity conversion}
\usage{
air_permeability_to_hydraulic_conductivity(x, calibration = "Iversen2003")
}
\arguments{
\item{x}{air permeability values (m²)}

\item{calibration}{Which calibration to use: Iversen2003 or Loll1999}
}
\value{
Hydraulic conductivity (m/s)
}
\description{
Converts an air permeability value into a value for hydraulic conductivity
}
\seealso{
\code{\link{tinyperm_to_hydraulic_conductivity}}, \code{\link{tinyperm_to_air_permeability}}
}

