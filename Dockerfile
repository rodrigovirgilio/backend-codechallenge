FROM ghcr.io/rnters/heroku-rails:20-3.0.2
LABEL maintainer="João Loff <joao@rnters.com>"

# for phantomJS
ENV QT_QPA_PLATFORM offscreen

RUN set -ex ;\
    # install all needed packages
    apt-get update ;\
    apt-get install -y --no-install-recommends \
        # update certificates
        ca-certificates \
        ;\
    rm -rf /var/lib/apt/lists/*

#------------
# Dockerize
#------------
ENV DOCKERIZE_VERSION=v0.6.1
RUN set -ex ;\
    wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz ;\
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz ;\
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

#------------
# Gemfile
#------------
COPY Gemfile* ./
RUN set -ex ;\
    bundle install --jobs 4 --retry 3