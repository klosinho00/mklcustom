
#' Print out a certain number with text.
#'
#' @param num The number which should be displayed. Numeric.
#'
#' @return Text output containing text and the number.
#' @export
#'
#' @examples
#' sayNumber()
#' sayNumber(2)
#' sayNumber(num=923)
sayNumber <- function(num=1) {
  print(paste0("The number is ", num, "."))
}


