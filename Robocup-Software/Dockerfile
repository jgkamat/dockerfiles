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
