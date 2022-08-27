#!/usr/bin/env bash

#################
# Let's install some ROS 2 (Foxy) prereqs.
# Are you ready?
################

###
# Let's set up a locale which supports UTF-8 encoding
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
# Add the ROS 2 apt repositories
###

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

###
# Add the ROS 2 apt repositories to your sources list.
###
