FROM rocker/r-ver:latest

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    odbc-postgresql 

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# install renv & restore packages
RUN install2.r rtweet googledrive

RUN groupadd -r tweet_alerts && useradd --no-log-init -r -g tweet_alerts tweet_alerts

ADD tweet_alerts.R /tweet_alerts.R

# EXPOSE 5432

USER tweet_alerts

CMD Rscript tweet_alerts.R