library(data.table)

dt <- as.data.table(iris)

dt[]

dt |> 
  fwrite("/home/rstudio/useR_2022/dt.csv")
