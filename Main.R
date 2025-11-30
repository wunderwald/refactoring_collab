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

# plot both ibi signals as line graph, histogram and box plot
ibi_plots(ibi_a_norm,"red")
ibi_plots(ibi_b_norm, "blue")

# plot dyad as scatter plot
dyad_plot(ibi_a_norm, ibi_b_norm, "purple")

# plot cross correlation function
xcorr_plot(ccf, "purple")