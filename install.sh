#!/usr/bin/env bash

#################
# Let's install some ROS 2 (Foxy) prereqs.
# Are you ready?
################

###
# Set up a locale which supports UTF-8 encoding
###

locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

###
# Enable the Ubuntu Universe repository
###

sudo apt install software-properties-common
sudo add-apt-repository universe

###
# Add the ROS 2 (Foxy) apt repositories
###

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

###
# Add the ROS 2 (Foxy) apt repositories to your system.
###

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

###
# Add the ROS 2 (Foxy) apt repositories to your sources list.
###

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

###
# Install the Desktop Version of ROS 2 (Foxy). Contains Along with ROS, RViz, demos, tutorials
###

sudo apt update && sudo apt upgrade
sudo apt install ros-foxy-desktop

###
# To install the Bare Bones Version of ROS 2 (Foxy), run the following commands. Contains just the communication libraries, message packages, command line tools.
###

# sudo apt install ros-foxy-ros-base

###
# To install the Bare Bones Version of ROS 2 (Foxy), run the following commands. Contains just the communication libraries, message packages, command line tools.
###

###
# Let's set up the ROS 2 (Foxy) Enviornment. Replace ".bash" with your shell if you're not using bash. Possible values are: setup.bash, setup.sh, setup.zsh
###

source /opt/ros/foxy/setup.bash
