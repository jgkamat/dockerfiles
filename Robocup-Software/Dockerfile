# watch out for an upgrade of ubuntu. Currently this is at 14.04
FROM phusion/baseimage:latest

# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update --fix-missing && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less debconf-utils w3m git software-properties-common scons cmake

# Enable insecure key
# to logon, run: ssh insecure_key root@<IP address>
RUN /usr/sbin/enable_insecure_key

# all commands will go to root's home folder
WORKDIR /root

# clone repo
RUN git clone git://github.com/RoboJackets/robocup-software

# install necessary software
WORKDIR /root/robocup-software

#TODO make ubuntu-setup take a force yes argument
RUN yes | util/ubuntu-setup

# Build
RUN make
RUN make robot
WORKDIR /root/robocup-software/run

# try to make dockerimages smaller
RUN apt-get clean

# The following is a futile attempt to get X working. It is a work in progress

# #TODO FIX THIS PART
# # Replace 1000 with your user / group id
# RUN export uid=1000 gid=1000 && \
#     mkdir -p /home/developer && \
#     echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#     echo "developer:x:${uid}:" >> /etc/group && \
#     echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#     chmod 0440 /etc/sudoers.d/developer && \
#     chown ${uid}:${gid} -R /home/developer
#
# USER developer
# ENV HOME /home/developer
# CMD /usr/bin/firefox


# to run X11 Server
# docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <COMMAND NAME>
