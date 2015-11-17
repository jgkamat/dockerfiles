docker run -d --name deluge  -p 8112:8112 -p 58846:58846 -p 58847:58847 -p 58847:58847/udp -ti -v /home jakexks/deluge-torrent-seedbox
docker run -it -d -p 80:80 --volumes-from <abovecontainer> <builtid>
