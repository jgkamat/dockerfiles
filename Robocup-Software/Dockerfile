# Use phusion/baseimage if problems arise
FROM robojackets/robocup-baseimage:master
MAINTAINER Jay Kamat github@jgkamat.33mail.com

WORKDIR /home/developer
RUN git clone https://github.com/RoboJackets/robocup-software.git
WORKDIR /home/developer/robocup-software

# Build
RUN make

WORKDIR /home/developer/robocup-software/run
# to run X11 Server
# docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <COMMAND NAME>
CMD [ "/home/developer/robocup-software/run/simulator & /home/developer/robocup-software/run/soccer -sim" ]
