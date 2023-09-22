test_that("Load RBR", {
  dat <- load_rbr(where = "here")
  expect_true(tibble::is_tibble(load_rbr(where = "here")))
})
