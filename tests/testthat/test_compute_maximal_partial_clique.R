context("Testing compute_maximal_partial_clique")

test_that("compute_maximal_partial_clique works", {
  set.seed(1)
  mat <- generate_partial_clique(n = 10,
                                 clique_fraction = 0.5,
                                 clique_edge_density = 0.9)$adj_mat
  res <- compute_maximal_partial_clique(mat, 0.9)
  #1: Checking that the function outputs something that is the correct type
  expect_true(is.list(res))
  #2: Simple checks to make sure outputs are within the correct range
  expect_true(all(res$clique_idx %in% 1:nrow(mat)))
  expect_true(res$edge_density >= 0.9)
})
#3: Making sure the function runs on many different inputs
test_that("function runs on different input", {
  set.seed(1)
  mat1 <- generate_partial_clique(n = 10,
                                 clique_fraction = 0.5,
                                 clique_edge_density = 0.9)$adj_mat
  res1 <- compute_maximal_partial_clique(mat1, 0.9)

  mat2 <- generate_partial_clique(n = 12,
                                  clique_fraction = 0.7,
                                  clique_edge_density = 0.8)$adj_mat
  res2 <- compute_maximal_partial_clique(mat2, 0.8)

  mat3 <- generate_partial_clique(n = 11,
                                  clique_fraction = 0.5,
                                  clique_edge_density = 0.7)$adj_mat
  res3 <- compute_maximal_partial_clique(mat3, 0.7)
  expect_false(identical(res1, res2))
  expect_false(identical(res1, res3))
  expect_false(identical(res2, res3))
})

#4: Testing to make sure it errors when expected
test_that("error on invalid matrix", {
  expect_error(
    compute_maximal_partial_clique(matrix(c(1)), 0.9),
    "adj_mat must have between 5 and 50 rows/columns"
  )
})

#7: Testing the behavior when there is deliberately no unique answer
test_that("test on deliberately no unique", {
  adj_mat <- matrix(c(
    1, 1, 1, 0, 0, 0,
    1, 1, 1, 1, 0, 0,
    1, 1, 1, 0, 1, 0,
    0, 1, 0, 1, 1, 1,
    0, 0, 1, 1, 1, 1,
    0, 0, 0, 1, 1, 1
  ), nrow = 6, byrow = TRUE)
  res <- compute_maximal_partial_clique(adj_mat, alpha = 0.8)
  expect_true(is.list(res))
  expect_true(length(res) > 0)
  expect_true(res$edge_density > 0.8)
})







