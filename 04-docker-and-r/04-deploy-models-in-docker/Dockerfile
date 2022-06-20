FROM  rstudio/plumber

LABEL purpose="Example of model deployment in Docker"

WORKDIR /plumber/
COPY model/lm_model.rds lm_model.rds
COPY model/plumb-model.R plumb-model.R
COPY model/predict.R predict.R

EXPOSE 8000

ENTRYPOINT ["Rscript", "-e", "source('plumb-model.R')"]