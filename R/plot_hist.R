#' plot histogram
#' @description function to plot histogram
#'
#' @param x data.frame to plot
#' @param breaks a vector giving the breakpoints between histogram cells, as of graphics::hist
#' @param freq logical for plotting frequencies, as of graphics::hist
#'
#' @importFrom graphics hist
plot_hist <- function(x, breaks, freq){
  variable <- names(x)[1] # take first variable
  hist(
    x[,variable], breaks = breaks, freq = freq,
    main = paste("Histogram of", variable),
    col = "darkgray", border = "white", xlab = variable
  )
}
