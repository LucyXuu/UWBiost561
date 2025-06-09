run_simulation <- function(trials,
                           clique_edge_density_vec,
                           clique_fraction = 0.9,
                           n = 10,
                           alpha = 0.7,
                           time_limit = 2,
                           imp_numbers = 1:15) {
  library(UWBiost561)

  result_by_density <- list()

  for (density in clique_edge_density_vec) {
    cat("Running for clique_edge_density =", density, "\n")

    trial_list <- lapply(1:trials, function(trial) {
      set.seed(trial)
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

          validated_alpha <- if (!is.na(out$clique_idx)) {
            UWBiost561::compute_correct_density(adj_mat, out$clique_idx)
          } else {
            NA
          }

          out$validated_alpha <- validated_alpha
          out
        }, error = function(e) {
          list(
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
