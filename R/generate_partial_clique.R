#' generate a partial clique
#'
#' @param n number of nodes in the graph
#' @param clique_fraction fraction of the n nodes that are part of the partial clique
#' @param clique_edge_density the edge density among the nodes in the clique
#'
#' @returns a random adjacency matrix that you construct with the partial clique
#' @example generate_partial_clique(n = 10, clique_fraction = 0.5, clique_edge_density = 0.95)
#' @export

generate_partial_clique <- function(n, clique_fraction, clique_edge_density){
  if(!is.numeric(n) || n <= 0 || n != floor(n) || length(n) != 1) {
    stop("n must be a single positive integer")
  }

  if(!is.numeric(clique_fraction) || clique_fraction > 1 || clique_fraction < 0 || length(n) != 1){
    stop("clique_fraction must be a single numeric between 0 and 1 (inclusive)")
  }

  if(!is.numeric(clique_edge_density) ||
     clique_edge_density < 0 || clique_edge_density > 1 || length(n) != 1) {
    stop("clique_edge_density must be a single numeric between 0 and 1 (inclusive)")
  }

  adj_mat <- matrix(0, nrow = n, ncol = n)
  diag(adj_mat) <- 1
  dimnames(adj_mat) <- NULL
  m <- round(n * clique_fraction)

  #selected random note to be 1
  clique_nodes <- sample(1:n, m, replace = FALSE)
  possible_edge <- combn(clique_nodes, 2)
  num_edges <- round(clique_edge_density * ncol(possible_edge))
  selected_link <- sample(1:ncol(possible_edge), num_edges, replace = FALSE)
  selected_edge <- possible_edge[, selected_link]

  for (i in 1:ncol(selected_edge)) {
    a <- selected_edge[1, i]
    b <- selected_edge[2, i]
    adj_mat[a, b] <- 1
    adj_mat[b, a] <- 1
  }

  return(list(adj_mat = adj_mat))
}
