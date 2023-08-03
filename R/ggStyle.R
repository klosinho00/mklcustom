#' Apply personal style options for ggplot2 objects
#'
#' This function returns some common options to ggplot2 objects.
#'
#' @param filename Path to filename, will be displayed as caption. Character string.
#' @param sizefac Factor by which the element sizes are being multiplied with. Numeric.
#'
#' @return list of ggplot2 options
#' @export
#'
#' @examples
#' if(FALSE){
#'  ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
#'  geom_point()+
#'  ggStyle(filename="path/Scripts/file.qmd", sizefac=1.2)
#' }

ggStyle <- function(filename, sizefac = 1) {

  # define ggplot2 styleoptions
  style_options <- list(

    labs(
      caption = paste0(
        format(Sys.Date(), format="%Y-%m-%d"),
        "  |  ",
        filename
      )
    ),
    theme_bw(),
    theme(plot.caption = element_text(size = 6*sizefac),
          axis.text = element_text(size = 10*sizefac),
          axis.title = element_text(size = 10*sizefac))
  )

  # return the options
  return(style_options)

}
