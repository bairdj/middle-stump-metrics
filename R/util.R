get_non_bowler_dismissals <- function() {
  c(
    "retired hurt",
    "retired not out",
    "run out"
  )
}

#' Apply commonly used column labels
#'
#' Wrapper for gt::cols_label() to apply commonly used column labels
#' without needing to manually specify them.
#'
#' @param x A gt object
#' @return A gt object
common_label <- function(x) {
  # Keys are raw column names, values are the labels to apply
  mapping <- c(
    StartDate = "Date",
    Team1 = "Team 1",
    Team2 = "Team 2"
  )

  # Check which columns are present in the
  present_cols <- colnames(x$`_data`)
  filtered_mapping <- mapping[intersect(present_cols, names(mapping))]

  if (length(filtered_mapping) == 0) {
    return(x)
  }

  gt::cols_label(
    x,
    !!!filtered_mapping
  )
}
