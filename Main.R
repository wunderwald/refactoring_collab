# install.packages("XLConnect")
library(XLConnect)

ibi <- readWorksheet(loadWorkbook("HRV_a.xlsx"),sheet=1, header=FALSE)
colnames(ibi) <- c("IBI")
ibi_a <- ibi$IBI
ibi <- readWorksheet(loadWorkbook("HRV_b.xlsx"),sheet=1, header=FALSE)
colnames(ibi) <- c("IBI")
ibi_b <- ibi$IBI
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

t <- 1:min(length(ibi_a_norm), length(ibi_b_norm))
plot(t, ibi_a_norm[t], type = "l", col = "blue", lwd = 2)
lines(t, ibi_b_norm[t], col = "red", lwd = 2)
# TODO plots
# boxplots for each
# line graphs together
# line graph for xcorr
# scatter plot together

# TODO analysis

