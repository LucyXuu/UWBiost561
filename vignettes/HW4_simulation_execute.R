rm(list = ls())
set.seed(10)
library(UWBiost561)

imp_numbers <- 1:15
trials <- 5
clique_edge_density_vec <- c(0.3, 0.7)
alpha <- 0.7  # fixed alpha, used for all simulations

# loop over the clique_edge_density values
density_trial_list <- lapply(clique_edge_density_vec, function(clique_density) {
  print(paste("Clique edge density:", clique_density))

  # loop over trials
  trial_list <- lapply(1:trials, function(trial) {
    print(paste("Working on trial:", trial))
    set.seed(trial)

    # generate adjacency matrix
    data <- UWBiost561::generate_partial_clique(
      n = 10,
      clique_fraction = 0.9,
      clique_edge_density = clique_density
    )
    adj_mat <- data$adj_mat

    # loop over all 15 implementations
    result_list <- lapply(imp_numbers, function(imp_number) {
      set.seed(trial)
      cat("*")
      result <- tryCatch({
        out <- UWBiost561::compute_maximal_partial_clique_master(
          adj_mat = adj_mat,
          alpha = alpha,
          number = imp_number,
          time_limit = 30
        )

        # append validated alpha
        validated_alpha <- if (!is.null(out$clique_idx)) {
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

    names(result_list) <- paste("Implementation:", imp_numbers)
    cat("\n")
    return(result_list)
  })

  names(trial_list) <- paste("Trial:", 1:trials)
  print("====")
  return(trial_list)
})

names(density_trial_list) <- paste0("clique_edge_density:", clique_edge_density_vec)

# save metadata
date_of_run <- Sys.time()
session_info <- devtools::session_info()

# save simulation output
save(density_trial_list,
     clique_edge_density_vec,
     alpha,
     date_of_run,
     session_info,
     file = "~/HW4_simulation.RData")
