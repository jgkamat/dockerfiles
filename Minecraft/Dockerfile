# SWEG's Minecraft Dockerimage
FROM java:8
MAINTAINER Jay Kamat github@jgkamat.33mail.com


# setup apt tools and other goodies we want
RUN apt-get update --fix-missing && apt-get -y install apt-utils wget curl htop iputils-ping vim-nox less debconf-utils tmux w3m git software-properties-common sudo rlwrap && apt-get clean


RUN mkdir -p /root/server
ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.8.8/minecraft_server.1.8.8.jar /root/server/minecraft_server.jar

# Add a docker init system and use it
ADD https://github.com/ohjames/smell-baron/releases/download/v0.1.0/smell-baron /bin/smell-baron
RUN sudo chown root:root /bin/smell-baron \
        && sudo chmod a+x /bin/smell-baron
ENTRYPOINT ["/bin/smell-baron"]

# This image is not meant to be run directly, it has not been compiled yet!
# In addition, it does not contain any source code, only dependencies
