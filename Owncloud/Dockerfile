FROM phusion/baseimage:latest

# This is a dockerfile that builds an owncloud service and sets it up as much as possible!
# to build: 'docker build -t jgkamat/owncloud .'

# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less

# add owncloud repository and install
RUN sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud.list"
RUN apt-get update

# If you want, you can change mysql to anything you want!
RUN apt-get install -y -q owncloud mysql-server ssh

# copy ssh key of current computer onto docker container
# if keys are not available, then you must run ssh-keygen before running this script
ADD id_rsa.pub /tmp/your_key.pub
RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/your_key.pub

# allow login with password
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config



# set admin password to 'toor'
RUN mysqladmin -u root password 'toor'

# ports 80 and 443 should be published in the command!
EXPOSE 22
