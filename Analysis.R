# install.packages("XLConnect")
library(XLConnect)

parse_xlsx <- function(path) {
  ibi <- readWorksheet(loadWorkbook(path),sheet=1, header=FALSE)
  colnames(ibi) <- c("IBI")
  return(ibi$IBI)
}

trim <- function(signal, other_signal) {
  min_length <- min(length(signal), length(other_signal))
  return(signal[1:min_length])
}

normalise <- function(signal) {
  min_sample <- min(signal)
  max_sample <- max(signal)
  range <- max_sample - min_sample
  return((signal - min_sample) / range)
}

xcorr <- function(signal_a, signal_b) {
  return(ccf(signal_a, signal_b, plot = FALSE))
}