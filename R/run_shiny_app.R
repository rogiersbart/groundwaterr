#' @export
run_shiny_app <- function(example) {
  # locate all the shiny app examples that exist
  validExamples <- list.files(system.file("shiny_apps", package = "groundwateR"))
  
  validExamplesMsg <-
    paste0(
      "Available apps are:\n'",
      paste(validExamples, collapse = "',\n'"),
      "'")
  
  # if an invalid example is given, throw an error
  if (missing(example) || !nzchar(example) ||
        !example %in% validExamples) {
    stop(
      'Please run `run_shiny_app()` with a valid app name as an argument\n',
      validExamplesMsg,
      call. = FALSE)
  }
  
  # find and launch the app
  appDir <- system.file("shiny_apps", example, package = "groundwateR")
  shiny::runApp(appDir, display.mode = "normal")
}