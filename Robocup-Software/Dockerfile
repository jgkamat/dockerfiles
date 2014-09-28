FROM ubuntu:14.04

# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update --fix-missing && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less debconf-utils w3m git

# all commands will go to root's home folder
WORKDIR /root

# clone repo
RUN git clone git://github.com/RoboJackets/robocup-software

# install nessicary software
WORKDIR /root/robocup-software
RUN yes | util/ubuntu-setup

# Build
RUN scons
WORKDIR /root/robocup-software/run
