# Use phusion/baseimage if problems arise
FROM jgkamat/robocup-baseimage
MAINTAINER Jay Kamat

# all commands will go to root's home folder

# Robojackets has already been cloned by robocup-baseimage

# install necessary software
WORKDIR /root/robocup-software

# update to latest and overwrite any merge conflicts
RUN git fetch origin master
RUN git reset --hard origin/master

#TODO make ubuntu-setup take a force yes argument
RUN yes | util/ubuntu-setup

# Build
RUN make
RUN make robot

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
