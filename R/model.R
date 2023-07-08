Model <- R6::R6Class(
  "Model",
  public = list(
    connection = NULL,
    initialize = function(path = NULL) {
      if (is.null(path)) {
        # Throw error if DB_LOCATION is not set
        if (nchar(Sys.getenv("DB_LOCATION")) == 0) {
          stop("DB_LOCATION environment variable not set")
        }
        path <- Sys.getenv("DB_LOCATION")
      }
      self$connection <- DBI::dbConnect(RSQLite::SQLite(), path)
    },
    table = function(tbl) {
      dplyr::tbl(self$connection, tbl)
    }
  )
)
