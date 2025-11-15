#!/bin/bash -e

on_chroot << EOF
apt-get update && apt-get install -y locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    echo "export LANG=en_US.UTF-8" >> /etc/bash.bashrc && \
    echo "export LC_ALL=en_US.UTF-8" >> /etc/bash.bashrc
EOF

on_chroot << EOF
apt-get update && apt-get install -y python3.12 python3.12-venv python3.12-dev
EOF

on_chroot << EOF
python3.12 -m pip install --upgrade pip
python3.12 -m pip install brother-ql-inventree poetry-grpc-plugin aiomqtt pycups aiohttp pyusb pillow paho-mqtt
EOF