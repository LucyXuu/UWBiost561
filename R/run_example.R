#' Run Example: create an example to generate a partial clique
#'
#' This function runs an example call to `generate_partial_clique()` with
#' preset parameters. It is primarily intended for demonstration purpose.
#'
#' @return A printed message and the result of `generate_partial_clique(n = 10, 0.9, 0.8)`.
#'
#' @examples
#' run_example()
#'
#'@export

run_example <- function() {
  print("generates a partial clique")
  generate_partial_clique(n=10, 0.9, 0.8)
}
