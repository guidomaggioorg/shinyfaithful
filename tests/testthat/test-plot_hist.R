test_that("plot_hist produces a plot", {
  bins <- 30
  x <- datasets::faithful[,"waiting", drop = FALSE]
  p <- plot_hist(x = x,
                 breaks = seq(min(x), max(x), length.out = bins + 1),
                 freq = TRUE)
  expect_visible(p)
  expect_type(p, "list")
  expect_s3_class(p, "histogram")
})
