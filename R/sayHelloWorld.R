#' Say hello to the new world and choose to what world you want to say hello.
#'
#' @param name Name of the world for which a hello statement should
#' be written. Needs to be a character.
#'
#' @return Character string based on the name variable and a greeting formula.
#' @export
#'
#' @examples
#' sayHelloWorld()
#' sayHelloWorld("jupiter")
#' sayHelloWorld(name="mars")
sayHelloWorld <- function(name="earth") {
  print(paste0("Helllo sweet sweet wooorld named ", name, "!"))
}

