#!/bin/bash

# Create /var/backup if not there 
mkdir -p /var/backup

# Create new /var/backup/home.tar
tar cvf /var/backup/home.tar /home

# Moves the file 'var/backup/home.tar' to 'var/backup/home.MMDDYYYY.tar'
mv /var/backup/home.tar /var/back/home.01012020.tar

# Creates an archive of '/home' and saves it to '/var/backup/home.tar' 
tar cvf /var/backup/system.tar /home

# List all files in '/var/backup' , including files sizes, and save the output to 
'/var/backup/file_report.txt'
ls -lh /var/backup > /var/backup/file_report.txt

# Print how much free memory there are on a system and save it to a called disk_report.txt .
free -h > /var/backup/disk_report.txt