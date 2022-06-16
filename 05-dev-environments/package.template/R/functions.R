#' Function for plotting Two Dimension
#' @description The function create a two dimension line plot with ggplot2
#' @details The function get two inputs, x and y, and returns a line plot
#' @param x A numeric, represents the x-axis
#' @param y A numeric, represents the y-axis
#' @param point A bolean, if set to TRUE (default), add geom_point to the plot
#' @return A ggplot2 line chart
#' @export
#' @examples
#'
#' line_plot(x = c(1:100), y = rnorm(n = 100, mean = 10, sd = 2))
#' # Without geom_point
#' line_plot(x = c(1:100), y = rnorm(n = 100, mean = 10, sd = 2), point = FALSE)
#'

line_plot<- function(x, y, point = TRUE){
  df <- data.frame(x = x, y = y)

  if(point){
  ggplot2::ggplot(data=df, ggplot2::aes(x=x, y=y)) +
    ggplot2::geom_line()+
    ggplot2::geom_point()
  } else {
    ggplot2::ggplot(data=df, ggplot2::aes(x=x, y=y)) +
      ggplot2::geom_line()
  }
}
