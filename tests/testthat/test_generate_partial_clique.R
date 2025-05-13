context("Testing generate_partial_clique")

test_that("errors on invalid n", {
  expect_error(
    generate_partial_clique(n = 0, clique_fraction = 0.5, clique_edge_density = 0.9),
    "n must be a single positive integer"
  )
})

test_that("error on invalid clique_fraction", {
  expect_error(
    generate_partial_clique(n = 10, clique_fraction = 5, clique_edge_density = 0.9),
    "clique_fraction must be a single numeric between 0 and 1 (inclusive)",
    fixed = TRUE
  )
})
