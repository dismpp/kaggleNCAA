
test_that("We can simulate a tourney", {
  f <- system.file('kaggle_data/sample_submission.csv', package = "kaggleNCAA", mustWork=TRUE)
  dat <- parseBracket(f)

  #Test all years without progress bar
  for(year in sort(unique(dat$season))){
    sim <- simTourney(dat, 5, year, progress=FALSE)
    expect_more_than(nrow(sim[slot=='R6CH',]), 63)
    expect_is(sim, 'data.table')
  }

  #Test one year with progress bar
  sim <- simTourney(dat, 5, year, progress=TRUE)
  expect_more_than(nrow(sim[slot=='R6CH',]), 63)
  expect_is(sim, 'data.table')
})