# Use phusion/baseimage if problems arise
FROM jgkamat/robocup-baseimage
MAINTAINER Jay Kamat

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
WORKDIR /root/robocup-software

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
