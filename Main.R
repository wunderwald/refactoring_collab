# TODO
# load data from excel files into variables ibi_a, ibi_b 
min_length <- min(length(ibi_a), length(ibi_b))
ibi_a <- ibi_a[1:min_length]
ibi_b <- ibi_b[1:min_length]
maxibi_a <- max(ibi_a)
maxibi_b <- max(ibi_b)
minibi_a <- min(ibi_a)
minibi_b <- min(ibi_b)
ibirange_a <- maxibi_a - minibi_a
ibirange_b <- maxibi_b - minibi_b
ibi_a_norm <- (ibi_a - minibi_a)/ibirange_a
ibi_b_norm <- (ibi_b - minibi_b)/ibirange_b
cross_corr <- ccf(ibi_a_norm, ibi_b_norm, plot = FALSE)
t <- 1:length(ibi_a_norm)
plot(t, ibi_a_norm[t], type = "l", lwd = 2, col = "red")
t <- 1:length(ibi_b_norm)
plot(t, ibi_b_norm[t], type = "l", lwd = 2, col = "blue")
plot(ibi_a_norm, ibi_b_norm, pch = 16, col = "purple")
boxplot(ibi_a_norm, col = "red")
boxplot(ibi_b_norm, col = "blue")
plot(cross_corr, col="purple")
hist(ibi_a_norm, col = "red")
hist(ibi_b_norm, col = "blue")
# TODO
# modularise


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