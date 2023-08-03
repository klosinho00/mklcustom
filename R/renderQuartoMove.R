#' Render .qmd file and move to target location
#'
#' This is a helper function as long as quarto does not natively supports
#' moving files to a certain location after rendering.
#' see https://github.com/quarto-dev/quarto-cli/discussions/2171 and
#  https://github.com/jhelvy/jph/blob/master/R/quarto_render_move.R
#'
#' @param input What is the filename called? Needs to contain .qmd at the end. Character string
#' @param output_file How should the output file be named? Needs to contain file suffix. Character string
#' @param output_dir Relative or absolute path to the desired output directory. Character string.
#' @param ... further arguments passed to quarto::quarto_render()
#'
#' @return none
#' @export
#'
#' @examples
#' if (FALSE) {
#'  # save timestamp for output file
#'  timestamp <- Sys.time() %>% format("%d-%m-%Y_%H-%M")
#'
#'  # define output file
#'  output_file <- paste0("ModifiedPriors_FullBayes_" , timestamp,  ".html")
#'
#'  # run quarto and move fileto target location
#'  quarto_render_move(input="ModifiedPriors_FullBayes.qmd",
#'               output_format="html",
#'               output_file = output_file,
#'               output_dir = "../Output/")
#'}
renderQuartoMove <- function(
    input,
    output_file = NULL,
    output_dir = NULL,
    ...
) {

  # Get all the input / output file names and paths
  x <- quarto::quarto_inspect(input)
  output_format <- names(x$formats)
  output <- x$formats[[output_format]]$pandoc$`output-file`
  if (is.null(output_file)) { output_file <- output }
  input_dir <- dirname(input)
  if (is.null(output_dir)) { output_dir <- input_dir }
  output_path_from <- file.path(input_dir, output)
  output_path_to <- file.path(output_dir, output_file)

  # Render qmd file to input_dir
  quarto::quarto_render(input = input, ... = ...)

  # If output_dir is different from input_dir, copy the rendered output
  # there and delete the original file
  if (input_dir != output_dir) {

    # Try to make the folder if it doesn't yet exist
    if (!dir.exists(output_dir)) { dir.create(output_dir) }

    # Now move the output to the output_dir and remove the original output
    file.copy(
      from = output_path_from,
      to = output_path_to,
      overwrite = TRUE
    )
    file.remove(output_path_from)

    # If the output_dir is the same as input_dir, but the output_file
    # has a different name from the input file, then just rename it
  } else if (output_file != output) {
    file.rename(from = output_path_from, to = output_path_to)
  }

  # open file
  system2("open", output_path_to)

}
