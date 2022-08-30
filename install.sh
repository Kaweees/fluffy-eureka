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
# Add the ROS 2 (Foxy) apt repositories to your system.
###

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

###
# Add the ROS 2 (Foxy) apt repositories to your sources list.
###

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

###
# Install either the Desktop Version or Bare Bones Version of ROS 2 (Foxy). 
# Bare Bones Version just contains the communication libraries, message packages, and command line tools.
# Desktop Version also includes a GUI, RViz, demos, and tutorials.
###

while true; do
  read -p "Would you like to install the Desktop or Bare Bones Version of ROS 2? (D/B): " version
  case $version in
    [Dd]* )
      sudo apt update && sudo apt upgrade
      sudo apt install ros-foxy-desktop
      break;;
    [Bb]* )
      sudo apt install ros-foxy-ros-base
      break;;
    * )
      echo "Invalid input, please try again.";;
  esac
done

###
# Let's source the ROS 2 (Foxy) setup files. Replace ".bash" with your shell if you're not using bash. Possible values are: setup.bash, setup.sh, setup.zsh
###

source /opt/ros/foxy/setup.bash

###
# Let's set the ROS Domain ID environment variable. The domain ID should be between 0 and 101, inclusively, for compatibility purposes.
###

while true; do
  read -p "Enter an ROS Domain ID: " number
  [[ $number =~ ^[0-9]+$ ]] || { echo "Enter a valid number"; continue; }
  if ((0 <= number && number <= 101)); then
  echo "valid number"
  break
  else
  echo "The Domain ID must be between 0 and 101, inclusively"
  fi
done

export ROS_DOMAIN_ID=number

###
# The ROS 2 development environment needs to be correctly configured before use.
# This can be done by sourcing the setup files in every new shell you open, or adding the source command to your startup script.
# Add the ROS 2 (Foxy) setup command and ROS Domain ID setting to the shell startup script upon user approval.
###

while true; do
  read -p "Would you like to add the ROS 2 (Foxy) setup command and Domain ID setting to your shell startup? (Y/N): " yn
  case $yn in
    [Yy]* )
      echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
      echo "export ROS_DOMAIN_ID=${number}" >> ~/.bashrc
      break;;
    [Nn]* )
      exit;;
    * ) echo "Invalid input, please try again.";;
  esac
done