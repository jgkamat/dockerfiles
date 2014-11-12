# Use phusion/baseimage if problems arise
FROM ubuntu:14.04

# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update --fix-missing && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less debconf-utils w3m git software-properties-common scons cmake ssh


# Get Upstart binary working. We remove a fake symlink to initctl and restore the original.
RUN rm /sbin/initctl; dpkg-divert --rename --remove /sbin/initctl
# generate a nice UTF-8 locale for our use
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
# Remove some services that don't make sense in containers.
RUN /usr/sbin/update-rc.d -f ondemand remove; \
for f in \
/etc/init/u*.conf \
/etc/init/mounted-dev.conf \
/etc/init/mounted-proc.conf \
/etc/init/mounted-run.conf \
/etc/init/mounted-tmp.conf \
/etc/init/mounted-var.conf \
/etc/init/hostname.conf \
/etc/init/tty*.conf \
/etc/init/plymouth*.conf \
/etc/init/hwclock*.conf \
/etc/init/module*.conf\
; do \
dpkg-divert --local --rename --add "$f"; \
done; \
echo '# /lib/init/fstab: cleared out for bare-bones Docker' > /lib/init/fstab
# allow login with password
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
# let Upstart know it's in a container
ENV container docker
# set an INSECURE password for root
RUN echo 'root:toor' | chpasswd


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
