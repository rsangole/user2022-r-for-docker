# Docker and R

This section introduces you to how to use R and Docker together. We start with a simple examples and move on to more advanced use cases.

We'll start of with an introduction to some useful base images, then look at installing R packages, look at how to develop in an IDE, and then move on to deploying scripts, models and shiny in Docker. 

R + Docker can be thought of roughly in a few paradigms:

1. Docker provides an R-based development environment
   1. R Packages and environment setup resides _in_ Docker 
   2. Code & data resides _outside_ Docker
2. Docker runs data ETL pipelines
   1. Code, R Packages and environment setup resides _in_ Docker
   2. Data & side effects reside _outside_ Docker
3. Docker runs predictive models
   1. Code, R Packages and environment setup resides _in_ Docker
   2. Data & side effects reside _outside_ Docker
4. Docker runs shiny dashboards
   1. Code, Data, R Packages and environment setup resides _in_ Docker

