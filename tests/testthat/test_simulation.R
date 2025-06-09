context("Testing code of simulation study")

test_that("run_simulation returns correct outer structure", {
  res <- run_simulation(trials = 1,
                        clique_edge_density_vec = c(0.3),
                        alpha = 0.7,
                        time_limit = 1,
                        imp_numbers = 1:2)

  expect_type(res, "list")
  expect_named(res, "clique_edge_density:0.3")
  expect_named(res[["clique_edge_density:0.3"]], "Trial:1")
  expect_named(res[["clique_edge_density:0.3"]][["Trial:1"]], c("Method_1", "Method_2"))
})


test_that("each result has expected fields", {
  res <- run_simulation(trials = 1,
                        clique_edge_density_vec = c(0.3),
                        alpha = 0.7,
                        time_limit = 1,
                        imp_numbers = 1)

  r <- res[["clique_edge_density:0.3"]][["Trial:1"]][["Method_1"]]
  expect_type(r, "list")
  expect_true(all(c("clique_idx", "edge_density", "status", "valid", "validated_alpha") %in% names(r)))
})

test_that("validated_alpha is numeric or NA", {
  res <- run_simulation(trials = 1,
                        clique_edge_density_vec = c(0.3),
                        alpha = 0.7,
                        time_limit = 1,
                        imp_numbers = 1)

  validated <- res[["clique_edge_density:0.3"]][["Trial:1"]][["Method_1"]]$validated_alpha
  expect_true(is.numeric(validated) || is.na(validated))
})
