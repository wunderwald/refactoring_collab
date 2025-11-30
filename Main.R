source("Analysis.R")
source("Plot.R")

# read data
ibi_a <- parse_xlsx("HRV_a.xlsx")
ibi_b <- parse_xlsx("HRV_b.xlsx")

# trim both ibi vectors to length of the shorter one
ibi_a <- trim(ibi_a, ibi_b)
ibi_b <- trim(ibi_b, ibi_a)

# normalise both signals to range 0,1
ibi_a_norm <- normalise(ibi_a)
ibi_b_norm <- normalise(ibi_b)

# calculate cross-correlation
ccf = xcorr(ibi_a_norm, ibi_b_norm)

t <- 1:min(length(ibi_a_norm), length(ibi_b_norm))
plot(t, ibi_a_norm[t], type = "l", lwd = 2, col = "red")
t <- 1:min(length(ibi_a_norm), length(ibi_b_norm))
plot(t, ibi_b_norm[t], type = "l", lwd = 2, col = "blue")
plot(ibi_a_norm, ibi_b_norm, pch = 16, col = "purple")
boxplot(ibi_a_norm, col = "red")
boxplot(ibi_b_norm, col = "blue")
plot(cross_corr, col="purple")
hist(ibi_a_norm, col = "red")
hist(ibi_b_norm, col = "blue")

# TODO
# modularise: analysis->read, normalise, cross-correlate; plot->ibi_plots, dyad_plots, xcorr_plot