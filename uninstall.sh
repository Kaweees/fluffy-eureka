#!/usr/bin/env bash

#################
# Let's uninstall ROS 2 (Foxy).
# Are you ready?
################

###
# Uninstall ROS 2 (Foxy).
###

sudo apt remove ~nros-foxy-* && sudo apt autoremove

###
# Remove the ROS 2 (Foxy) apt repositories from your system
###

sudo rm /etc/apt/sources.list.d/ros2.list
sudo apt update
sudo apt autoremove
# Consider upgrading for packages previously shadowed.
sudo apt upgrade
