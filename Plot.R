#' Plotting Module
#' 
#' This module contains all plotting functions needed for Main.R.
#'
#' Moritz Wunderwald, 2025
#' code@moritzwunderwald.de

#' Create a Line Graph
#'
#' Plots a signal as a line graph with customizable color.
#'
#' @param signal A numeric vector containing the signal values to be plotted.
#' @param color A character string specifying the color of the line (e.g., "red", "#FF0000").
#'
#' @return Invisibly returns NULL. Produces a scatter plot as a side effect.
line_graph <- function(signal, color) {
  t <- 1:length(signal)
  plot(t, signal[t], type = "l", lwd = 2, col = color)
}


#' Create IBI Plots
#'
#' Generates a set of three plots for Inter-Beat-Interval data:
#' a line graph, histogram, and box plot. All plots are displayed with the specified color.
#'
#' @param ibi A numeric vector containing IBI values to be plotted.
#' @param color A character string specifying the color to use for all plots.
#'
#' @return Invisibly returns NULL. Produces a scatter plot as a side effect.
ibi_plots <- function(ibi, color) {
  # line graph
  line_graph(ibi, color)
  
  # histogram
  hist(ibi, col = color)
  
  # box plot
  boxplot(ibi, col = color)
}

#' Create a Scatter Plot of Dyadic IBI Data
#'
#' @description
#' Generates a scatter plot comparing inter-beat interval (IBI) measurements
#' between two individuals in a dyad.
#'
#' @param ibi_a Numeric vector of inter-beat interval values for individual A.
#' @param ibi_b Numeric vector of inter-beat interval values for individual B.
#' @param color Character string specifying the color of the plotted points.
#'
#' @return Invisibly returns NULL. Produces a scatter plot as a side effect.
dyad_plot <- function(ibi_a, ibi_b, color) {
  # scatter plot
  plot(ibi_a, ibi_b, pch = 16, col = color)
}

#' Plot Cross Correlation Function
#'
#' Creates a plot of the cross correlation function (CCF) for the given data.
#'
#' @param xcorr_data An object of class "acf" or similar containing cross correlation data to be plotted.
#' @param color Character string specifying the color of the plotted points.
#'
#' Invisibly returns NULL. Produces a scatter plot as a side effect.
xcorr_plot <- function(xcorr_data, color) {
  # plot ccf (cross correlation function)
  plot(xcorr_data, col = color)
}
