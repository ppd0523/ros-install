#!/bin/bash

INSTALL_USER=$1

if [ ! -e /home/$INSTALL_USER ]; then
  echo "-- Not fount: /home/$INSTALL_USER --"
  exit 0
fi

# Dependency
apt update && \
apt install -y openssh-server git vim curl tree cmake g++ python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Setup sources.list
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
apt update && \

apt-get install -y ros-kinetic-desktop-full && \
#apt-get install -y ros-kinetic-desktop && \
#apt-get install -y ros-kinetic-ros-base && \


PWD=dirname $0

echo "source /home/$INSTALL_USER/.rosrc" >> /home/$INSTALL_USER/.bashrc && \
cp -p $PWD/.rosrc /home/$INSTALL_USER && \
rosdep init && \
rosdep update && \
echo "--- Install Finished! ---"
