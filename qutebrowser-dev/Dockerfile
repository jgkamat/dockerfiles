FROM fedora:latest

RUN dnf install -y python3-qt5-webengine qt5-qtwebengine python3-qt5-webkit git sudo bitstream-vera-serif-fonts bitstream-vera-sans-fonts bitstream-vera-sans-mono-fonts


# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
WORKDIR /home/developer

RUN git clone https://github.com/The-Compiler/qutebrowser.git && sudo pip3 install qutebrowser/
CMD ["/usr/bin/qutebrowser", "--backend", "webengine"]

# RUN WITH
# docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.local:/home/developer/.local -v ~/.config:/home/developer/.config jgkamat/qutebrowser-dev
# For Sound
# docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.local:/home/developer/.local -v ~/.config:/home/developer/.config -v /dev/snd:/dev/snd --privileged jgkamat/qutebrowser-dev
