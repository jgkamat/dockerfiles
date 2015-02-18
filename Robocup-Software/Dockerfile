# Use phusion/baseimage if problems arise
FROM jgkamat/robocup-baseimage
MAINTAINER Jay Kamat

# all commands will go to root's home folder

# Robojackets has already been cloned by robocup-baseimage

# install necessary software
WORKDIR /home/developer/robocup-software

# update to latest and overwrite any merge conflicts
RUN git fetch origin master
RUN git reset --hard origin/master

#TODO make ubuntu-setup take a force yes argument
RUN yes | util/ubuntu-setup && sudo apt-get clean

# Build
RUN make
RUN make robot2015

WORKDIR /home/developer/robocup-software/run

# to run X11 Server
# docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <COMMAND NAME>
