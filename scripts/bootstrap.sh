#!/bin/bash

# Update the base system
# Most of this stuff should get moved to the base box eventually


# Get detarpm first, so we can download less stuff
yum install -y deltarpm

# Get the latest stuff
yum -y update


# Install an ntpd that works well with vms 
yum install -y chrony

# Install various ops stuff
yum install -y epel-release nload htop iostat psmisc iotop yum-cron policycoreutils-python

# Install various dev tools
yum install -y git wget curl tree emacs-nox vim ack tmux screen lynx links


# Add github ssh fingerprints to vagrant ssh known_hosts
ssh-keyscan github.com | sudo -u vagrant tee -a  /home/vagrant/.ssh/known_hosts
