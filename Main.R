# TODO
# implement xlsx loading, modularise

parse_xlsx <- function(path) {
  # TODO implement loading XLSX
  return(0)
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
line_graph <- function(signal, color) {
  t <- 1:length(signal)
  plot(t, signal[t], type = "l", lwd = 2, col = color)
}
ibi_plots <- function(ibi, color) {
  line_graph(ibi, color)
  hist(ibi, col = color)
  boxplot(ibi, col = color)
}
dyad_plot <- function(ibi_a, ibi_b, color) {
  plot(ibi_a, ibi_b, pch = 16, col = color)
}
xcorr_plot <- function(xcorr_data, color) {
  plot(xcorr_data, col = color)
}
ibi_a <- parse_xlsx("HRV_a.xlsx")
ibi_b <- parse_xlsx("HRV_b.xlsx")
ibi_a <- trim(ibi_a, ibi_b)
ibi_b <- trim(ibi_b, ibi_a)
ibi_a_norm <- normalise(ibi_a)
ibi_b_norm <- normalise(ibi_b)
ccf = xcorr(ibi_a_norm, ibi_b_norm)
ibi_plots(ibi_a_norm,"red")
ibi_plots(ibi_b_norm, "blue")
dyad_plot(ibi_a_norm, ibi_b_norm, "purple")
xcorr_plot(ccf, "purple")