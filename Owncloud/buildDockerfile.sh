#!/bin/bash

# automatically sets up enviroment and builds docker container

# copy over ssh keys, if not there, make them!

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    # Generate a ssh key with no password!
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi
cp ~/.ssh/id_rsa.pub "`dirname $0`/id_rsa.pub"

sudo docker build -t jgkamat/owncloud .
