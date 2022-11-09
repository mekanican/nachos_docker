#!/bin/bash

API_KEY=
USERNAME=
EMAIL=

if test -f "/tmp/checkthefirsttime"; then
    cd nachos
    /bin/bash
else
    touch /tmp/checkthefirsttime
    cd /home/project/nachos

    git config --global user.name "$USERNAME"
    git config --global user.email "$EMAIL"

    rm *.gz
    rm *.diff

    cd NachOS-4.0/code/build.linux
    make depend
    make
    make clean

    cd ../../coff2noff
    make
    make clean

    cd /tmp
    git clone https://$API_KEY@github.com/vanloc1808/HCMUS-Operating-Systems
    cp -rlf ./HCMUS-Operating-Systems/* /home/project/nachos/
    cp -rlf ./HCMUS-Operating-Systems/.git /home/project/nachos/
    cp -rlf ./HCMUS-Operating-Systems/.gitignore /home/project/nachos/

    cd /home/project/nachos

    clear

    /bin/bash
fi