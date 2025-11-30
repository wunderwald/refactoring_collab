

# load dependencies
# install.packages("XLConnect")
library(XLConnect)

#' Parse XLSX File and Extract IBI Column
#'
#' Reads an Excel worksheet and extracts the IBI (Inter-Beat Interval) column
#' as a numeric vector.
#'
#' @param path Character string specifying the file path to the XLSX file.
#'
#' @return Numeric vector containing the IBI values from the first worksheet.
parse_xlsx <- function(path) {
  ibi <- readWorksheet(loadWorkbook(path),sheet=1, header=FALSE)
  colnames(ibi) <- c("IBI")
  return(ibi$IBI)
}

#' Trim Signals to Common Length
#'
#' Trims two signals to the same length by taking the minimum length.
#'
#' @param signal Numeric vector representing the primary signal.
#' @param other_signal Numeric vector representing the secondary signal.
#'
#' @return Numeric vector containing the trimmed primary signal.
trim <- function(signal, other_signal) {
  min_length <- min(length(signal), length(other_signal))
  return(signal[1:min_length])
}

#' Normalize Signal to Unit Range
#'
#' Min-max normalization: scales signal values to the range [0, 1].
#'
#' @param signal Numeric vector to be normalized.
#'
#' @return Numeric vector with values scaled to [0, 1].
normalise <- function(signal) {
  min_sample <- min(signal)
  max_sample <- max(signal)
  range <- max_sample - min_sample
  return((signal - min_sample) / range)
}

#' Compute Cross-Correlation Between Two Signals
#'
#' Calculates the cross-correlation function between two signals.
#'
#' @param signal_a Numeric vector representing the first signal.
#' @param signal_b Numeric vector representing the second signal.
#'
#' @return Cross-correlation object from ccf function.
xcorr <- function(signal_a, signal_b) {
  return(ccf(signal_a, signal_b, plot = FALSE))
}