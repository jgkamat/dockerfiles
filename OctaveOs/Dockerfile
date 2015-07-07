FROM java:7

# This is a dockerfile that builds an octave os, it dosent really work right now

# The base image changes policy-rc.d to stop services from being configured by apt. We change this to mirror stock Ubuntu.
# Setup apt to be happy with no console input
ENV DEBIAN_FRONTEND noninteractive

# setup apt tools and other goodies we want
RUN apt-get update && apt-get -y install --no-install-recommends octave

ADD smell-baron /bin/smell-baron
ENTRYPOINT ["/bin/smell-baron"]
CMD ["/usr/bin/octave" ]
