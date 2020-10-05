#!/bin/sh

if [ ! -f autotorrent.conf ]; then
    echo "First run, creating autotorrent.conf"
    echo n | autotorrent --create_config
    echo "Configure autotorrent.conf and restart container"
    exit
fi

autotorrent -r

autotorrent -a /torrents/*.torrent $EXTRA_ARGS
