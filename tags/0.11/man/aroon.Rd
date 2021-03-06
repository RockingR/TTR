\name{aroon}
\alias{aroon}
\title{ Aroon }
\concept{trend}
\description{
  The Aroon indicator attempts to identify starting trends.  The indicator consists
  of up and down lines, which measure how long it has been since the highest high/lowest
  low has occurred in the last \code{n} periods.  Developed by Tushar Chande in 1995.
}
\usage{
  aroon(HL, n=20)
}
\arguments{
  \item{HL}{ Object able to be coerced to a matrix, which contains either a High-Low price
    series, or a Close price series. }
  \item{n}{ Number of periods to use in the calculation. }
}
\details{
  Aroon up (down) is the elapsed time, expressed as a percentage, between today and the highest
  (lowest) price in the last \code{n} periods.  If today's price is a new high (low)
  Aroon up (down) will be 100. Each subsequent period without another new high (low) causes
  Aroon up (down) to decrease by (1 / \code{n}) x 100.
}
\value{
  A matrix containing the columns:
  \item{ aroon.up }{ The Aroon up indicator. }
  \item{ aroon.dn }{ The Aroon down indicator. }
  \item{ oscillator }{ The Aroon oscillator (\code{aroon.up - aroon.dn}). }
}
\author{ Josh Ulrich }
\references{
  The following site(s) were used to code/document this indicator:\cr
  \url{http://www.fmlabs.com/reference/Aroon.htm}\cr
  \url{http://www.fmlabs.com/reference/AroonOscillator.htm}\cr
  \url{http://www.linnsoft.com/tour/techind/aroon.htm}\cr
  \url{http://stockcharts.com/education/IndicatorAnalysis/indic-Aroon.htm}\cr
}
\note{
  If High-Low prices are given, the function calculates the max/min using the high/low prices.
  Otherwise the function calculates the max/min of the single series.

  Up (down) trends are indicated when the aroon.up(dn) is between 70 and 100.  Strong trends
  are indicated when when the aroon.up(dn) is above 70 while the aroon.dn(up) is below 30.
  Also, crossovers may be useful.
}
\seealso{
  See \code{\link{CCI}}, \code{\link{ADX}}, \code{\link{TDI}}, and \code{\link{VHF}}
  for other indicators that measure trend direction/strength.
}
\examples{
  ## Get Data and Indicator ##
  data(nasdaq)
  trend <- aroon( nasdaq[,c("High", "Low")], n=20 )
}
\keyword{ ts }