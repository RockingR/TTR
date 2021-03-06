#-------------------------------------------------------------------------#
# TTR, copyright (C) Joshua M. Ulrich, 2007                               #
# Distributed under GNU GPL version 3                                     #
#-------------------------------------------------------------------------#

"SAR" <-
function(HL, accel=c(.02,.2)) {

  # Parabolic Stop-and-Reverse (SAR)
  # ----------------------------------------------
  #       HL = HL vector, matrix, or dataframe
  # accel[1] = acceleration factor
  # accel[2] = maximum acceleration factor

  # http://www.linnsoft.com/tour/techind/sar.htm
  # http://www.fmlabs.com/reference/SAR.htm
  # http://stockcharts.com/education/IndicatorAnalysis/indic_ParaSAR.htm
  # http://www.equis.com/Customer/Resources/TAAZ/?c=3&p=87

  # WISHLIST:
  # Determine signal based on DM+/DM- for first bar
  # If sig[1]==1, then ep[1]==high; if sig[1]==-1, then ep[1]==low
  # The first SAR value should be the opposite (high/low) of ep
  # The first acceleration factor is based on the first signal

  # Since I've already lost one bar, do what TA-lib does and use that bar to
  # determine the inital signal value.  Also try to incorporate different
  # accel factors for long/short.
  # accel = c( long = c( 0.02, 0.2 ), short = long )

  HL <- as.matrix(HL)

  # Initialize necessary vector
  sar <- rep(0,NROW(HL))

  sar <- .Fortran("psar", iha = as.double( HL[,1] ),
                          ila = as.double( HL[,2] ),
                          la  = as.integer( NROW( HL ) ),
                          af  = as.double( accel[1] ),
                          maf = as.double( accel[2] ),
                          sar = as.double( sar ),
                          PACKAGE = "TTR" )$sar

  return( sar )
}
