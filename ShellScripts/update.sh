#!/bin/bash

# makes sure that apt has all availabile updates
apt update -y

# Upgrade all installed packages 
apt upgrade -y

# Install new packages, and uninstall old packages
apt full-upgrade -y

# Remove unused packages and their associated configuration files
apt autoremove --purge -y 

# Bonus -Peform with a single line of code 
apt update -y && apt update -y && apt full-upgrade -y && apt-get autoremove --purge -y 