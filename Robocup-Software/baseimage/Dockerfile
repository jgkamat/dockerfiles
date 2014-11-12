# Use phusion/baseimage if problems arise
FROM ubuntu:14.04
MAINTAINER Jay Kamat

# This dockerimage will serve as a 'static' base for the robocup dockerimage to reduce build time

# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update --fix-missing && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less debconf-utils w3m git software-properties-common scons ssh

# setup some large things that will *always* be part of robocup's repo
#TODO link this up to ubuntu-packages.txt somehow?
RUN apt-get update --fix-missing && apt-get -y install python3-dev build-essential gtkwave clang doxygen qt5-default python-usb


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
