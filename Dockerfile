FROM ubuntu:latest

COPY . /opt/easypeasyespanol.github.io

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN \
  apt-get update \
    && \
  apt-get install -y -qq --no-install-recommends \
    cabextract \
    ttf-mscorefonts-installer \
    fontconfig \
    && \
  echo "installed base dependencies"
  
########################################################
# setup fonts
########################################################
RUN \
  wget https://www.freedesktop.org/software/fontconfig/webfonts/webfonts.tar.gz \
    && \
  tar -xzf webfonts.tar.gz \
    && \
  cd msfonts/ \
    && \
  cabextract *.exe \
    && \
  fc-cache -fv \
    && \
  echo "installed fonts" \
    && \
  fc-list
