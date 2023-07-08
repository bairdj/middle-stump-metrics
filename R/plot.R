theme_cricket <- function(grid = "y") {
  base_theme <-
    ggplot2::theme(
      panel.background = ggplot2::element_rect(fill = "#F4F4F4"),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank()
    )

  if (grid == "y") {
    base_theme <- base_theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_line(
          colour = "#DDDDDD"
        )
      )
  }
}
