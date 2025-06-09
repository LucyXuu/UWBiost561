# HW4_simulation_execute.R

library(UWBiost561)

# Set simulation parameters
trials <- 2
clique_edge_density_vec <- c(0.3, 0.7)
clique_fraction <- 0.9
n <- 10
alpha <- 0.7
time_limit <- 30
imp_numbers <- 1:15

# Run the simulation
results <- run_simulation(
  trials = trials,
  clique_edge_density_vec = clique_edge_density_vec,
  clique_fraction = clique_fraction,
  n = n,
  alpha = alpha,
  time_limit = time_limit,
  imp_numbers = imp_numbers
)

# Save results to home directory
date_of_run <- Sys.time()
session_info <- devtools::session_info()

save(results,
     trials,
     clique_edge_density_vec,
     clique_fraction,
     n,
     alpha,
     time_limit,
     imp_numbers,
     date_of_run,
     session_info,
     file = "~/HW4_simulation.RData")
