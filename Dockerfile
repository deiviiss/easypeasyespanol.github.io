FROM ubuntu:20.04

COPY . /opt/easypeasyespanol.github.io

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

ls -R > filename1
