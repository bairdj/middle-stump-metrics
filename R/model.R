Model <- R6::R6Class(
  "Model",
  public = list(
    connection = NULL,
    initialize = function(path = NULL) {
      if (is.null(path)) {
        path <- Sys.getenv("DB_LOCATION")
      }
      self$connection <- DBI::dbConnect(RSQLite::SQLite(), path)
    },
    table = function(tbl) {
      dplyr::tbl(self$connection, tbl)
    }
  )
)
