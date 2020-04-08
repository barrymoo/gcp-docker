# GCP Client
FROM ubuntu:bionic

# Maintainer 
MAINTAINER Barry Moore "moore0557@gmail.com"

# update system
RUN apt-get update &&  apt-get upgrade -y && apt-get dist-upgrade -y

# install some system tools
RUN apt-get install -y wget python

# install GCP client
RUN cd /opt && \
  wget -c https://downloads.globus.org/globus-connect-personal/v3/linux/stable/globusconnectpersonal-latest.tgz && \
  tar xzf globusconnectpersonal-latest.tgz
RUN rm /opt/globusconnectpersonal-latest.tgz
RUN mv /opt/globusconnectpersonal-* /opt/globusconnectpersonal

# Use baseimage-docker's bash
CMD ["/bin/bash"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add GCP to PATH
ENV PATH /opt/globusconnectpersonal:$PATH
