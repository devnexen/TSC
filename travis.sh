#!/usr/bin/env bash

set -e

mkdir install
export INSTALL_PREFIX=$PWD/install

hg clone -b v0-8 https://bitbucket.org/cegui/cegui
cd cegui
mkdir build
cd build
cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX
ninja install
cd ../..

ls -R $INSTALL_PREFIX

curl -Lo sfml.tgz https://www.sfml-dev.org/files/SFML-2.4.2-linux-gcc-64-bit.tar.gz
tar xvf sfml.tgz
cp -r SFML-2.4.2/* $INSTALL_PREFIX

mkdir build
cd build
cmake -G Ninja ../tsc -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX
ninja install

ls -R $INSTALL_PREFIX