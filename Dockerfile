#source: https://lalejini.com/2021/01/09/bookdown-autodeploy.html

# Pull a base image
FROM ubuntu:latest

# Copy everything (minus anything specified in .dockerignore) into the image
COPY . /opt/easypeasyespanol.github.io

# To make installs not ask questions about timezones
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

##############################
# install base dependencies
# - for R repository
#   - dirmngr
#   - gpg-agent
# - for bookdown compilation
#   - pandoc, pandoc-citeproc, texlive-base, texlive-latex-extra
##############################

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN \
  apt-get update \
    && \
  apt-get install -y -qq --no-install-recommends \
    ttf-mscorefonts-installer
    
RUN \
  fc-cache -fv \
    && \
  fc-list

RUN \
  cd /opt/easypeasyespanol.github.io
    && \
  mkdir _book
