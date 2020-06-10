#!/bin/bash

# pkg
sudo apt install -y git-core vim curl python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
sudo apt-get install ros-kinetic-desktop-full && \
#sudo apt-get install ros-kinetic-desktop && \
#sudo apt-get install ros-kinetic-ros-base && \
git clone https://github.com/ppd0523/ros-install.git && \

echo "source $HOME/.rosrc" >> ~/.bashrc && \
cp -p .rosrc $HOME && \
sudo rosdep && \
rosdep update && \
echo "--- Install Finished! ---"