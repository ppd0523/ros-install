#!/bin/bash

# Dependency
sudo apt update && \
sudo apt install -y git-core vim curl python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
sudo apt update && \

sudo apt-get install -y ros-kinetic-desktop-full && \
#sudo apt-get install -y ros-kinetic-desktop && \
#sudo apt-get install -y ros-kinetic-ros-base && \


echo "source $HOME/.rosrc" >> ~/.bashrc && \
cp -p .rosrc $HOME && \
sudo rosdep init && \
rosdep update && \
echo "--- Install Finished! ---"
