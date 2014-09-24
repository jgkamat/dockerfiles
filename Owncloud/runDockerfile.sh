#!/bin/bash

# runs the dockerfile with ports opened

docker run -p 80:80 -p 443:443 jgkamat/owncloud
