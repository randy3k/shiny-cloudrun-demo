FROM rocker/shiny

RUN R --slave -e "install.packages('remotes')"
RUN R --slave -e "remotes::install_github(c('rstudio/httpuv'))"

COPY app.R /srv/shiny-server/app.R

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf

EXPOSE 8080

USER shiny

# avoid s6 initialization
# see https://github.com/rocker-org/shiny/issues/79
CMD ["/usr/bin/shiny-server"]
