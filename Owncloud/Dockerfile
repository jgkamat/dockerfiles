FROM ubuntu:14.04

# Lets see if we can use this instead later!
#FROM phusion/baseimage:latest


# This is a dockerfile that builds an owncloud service and sets it up as much as possible!
# to build: 'docker build -t jgkamat/owncloud .'

# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less debconf-utils

# add owncloud repository and install
RUN sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud.list"

# Fix authentication issues
RUN wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key
RUN sudo apt-key add - < Release.key
RUN apt-get update --fix-missing
RUN apt-get -y upgrade


#Stop password requests from apt for mysql (password is toor)
# If you want, you can change mysql to anything you want!

RUN bash -c "debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor' && debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor' && apt-get install -y mysql-server ssh"
RUN apt-get install -y owncloud

# copy ssh key of current computer onto docker container
# if keys are not available, then you must run ssh-keygen before running this script
ADD id_rsa.pub /tmp/your_key.pub
RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/your_key.pub

# allow login with password
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# ports 80 and 443 should be published in the command!
EXPOSE 22
