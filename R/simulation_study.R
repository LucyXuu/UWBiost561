#' run a simulation study on given functions that computes maximal partial clique for a given matrix
#'
#' @param trials number of trials to run for each setting each function
#' @param clique_edge_density_vec  list of edge density among the nodes in the clique of the generated matrix
#' @param clique_fraction fraction of the n nodes that are part of the partial clique of the generated matrix
#' @param n number of nodes in the graph of the generated matrix
#' @param alpha alpha level that the partial clique has to achieve
#' @param time_limit maximum time in seconds each implementation can run for.
#' @param imp_numbers which implementations to run simulation upon. Need to be between 1 and 15.
#'
#'
#' @returns results of each implementation
#' @example run_simulation(trials=2, clique_edge_density_vec = c(0.95,0.5), time_limit = 30, imp_numbers = 1:3)
#' @export


run_simulation <- function(trials,
                           clique_edge_density_vec,
                           clique_fraction = 0.5,
                           n = 10,
                           alpha = 0.95,
                           time_limit = 2,
                           imp_numbers = 1:15) {
  library(UWBiost561)

  result_by_density <- list()

  for (density in clique_edge_density_vec) {
    cat("Running for clique_edge_density =", density, "\n")
    trial_list <- lapply(1:trials, function(trial) {
      adj_mat <- UWBiost561::generate_partial_clique(
        n = n,
        clique_fraction = clique_fraction,
        clique_edge_density = density
      )$adj_mat

      result_list <- lapply(imp_numbers, function(imp_number) {
        set.seed(trial)
        cat(".")
        result <- tryCatch({
          out <- UWBiost561::compute_maximal_partial_clique_master(
            adj_mat = adj_mat,
            alpha = alpha,
            number = imp_number,
            time_limit = time_limit
          )

          validated_alpha <- if (!is.null(out$clique_idx)) {
            UWBiost561::compute_correct_density(adj_mat, out$clique_idx)
          } else {
            NA
          }

          out$validated_alpha <- validated_alpha
          return(out)
        }, error = function(e) {
          list(
            error = e,
            clique_idx = NULL,
            edge_density = NA,
            status = "error",
            valid = FALSE,
            validated_alpha = NA
          )
        })
        return(result)
      })

      names(result_list) <- paste0("Method_", imp_numbers)
      return(result_list)
    })

    names(trial_list) <- paste0("Trial:", 1:trials)
    result_by_density[[paste0("clique_edge_density:", density)]] <- trial_list
    cat("\n")
  }

  return(result_by_density)
}
