FROM  rocker/shiny:4.2.0

LABEL purpose="Example of shiny deployment in Docker"

WORKDIR /home/app
COPY my_app .

EXPOSE 3838

CMD ["R", "-e", "options(shiny.port = 3838, shiny.host = '0.0.0.0'); shiny::runApp('/home/app')"]