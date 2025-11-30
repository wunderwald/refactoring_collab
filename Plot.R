line_graph <- function(signal, color) {
  t <- 1:length(signal)
  plot(t, signal[t], type = "l", lwd = 2, col = color)
}

ibi_plots <- function(ibi, color) {
  # line graph
  line_graph(ibi, color)
  
  # histogram
  hist(ibi, col = color)
  
  # box plot
  boxplot(ibi, col = color)
}

dyad_plot <- function(ibi_a, ibi_b, color) {
  # scatter plot
  plot(ibi_a, ibi_b, pch = 16, col = color)
}

xcorr_plot <- function(xcorr_data, color) {
  # plot ccf (cross correlation function)
  plot(xcorr_data, col = color)
}
