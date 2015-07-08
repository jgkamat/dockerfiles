# Use phusion/baseimage if problems arise
FROM fedora:22
MAINTAINER Jay Kamat

# setup apt tools and other goodies we want
RUN dnf -y install gcc gradle make which gcc-c++

ADD smell-baron /bin/smell-baron
ENTRYPOINT ["/bin/smell-baron"]
CMD ["/usr/bin/gradle" ]

