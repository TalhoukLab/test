FROM rocker/rstudio:4.4.2

RUN R -e "install.packages(c('renv', 'tinytex'), repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "tinytex::install_tinytex()"

#RUN apt-get update -qq && apt-get -y --no-install-recommends install \
#    && install2.r --error --skipmissing --deps TRUE --skipinstalled \
#        tinytex

#WORKDIR /project
#COPY renv.lock renv.lock

#RUN mkdir -p renv
#COPY .Rprofile .Rprofile
#COPY renv/activate.R renv/activate.R
#COPY renv/settings.json renv/settings.json

COPY . /project
WORKDIR /project

RUN R -e "renv::restore()"
RUN quarto render