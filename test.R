create_df <- function(res, year, sex) {
  # determine which time to use
  use_time <- if (!is.na(res[1,'net'])) {
    res[ ,'net']
  } else if (!is.na(res[1,'gun'])) {
    res[ ,'gun']
  } else {
    res[ ,'time']
  }
  # remove #, *, and blanks from time
  use_time <- str_replace_all(use_time, '[#\\*[:blank:]]', '')
  # drop rows with no time
  res <- res[use_time != '', ]
  run_time <- convert_time(use_time[use_time != ''])
  
  results <- data_frame(year = year,
                        sex = sex,
                        name = res[ ,'name'],
                        home = res[ ,'home'],
                        age = as.numeric(res[ ,'ag']),
                        time = run_time)
  
  invisible(results)
}

df <- create_df(men_res_mat[['2007']], year = 2007, sex = 'm')
