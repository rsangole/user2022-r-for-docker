lm_model <- lm(mpg ~ cyl + disp + hp, data = mtcars)

lm_model

saveRDS(lm_model, "lm_model.rds")
