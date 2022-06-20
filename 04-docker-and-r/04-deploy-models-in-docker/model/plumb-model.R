message("Running plumb-model.R")

library(plumber)

lm_model <- readRDS("lm_model.rds")

pr("predict.R") |> 
	pr_run(port=8000, host="0.0.0.0")