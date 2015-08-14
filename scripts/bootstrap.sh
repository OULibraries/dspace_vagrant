#!/bin/bash

# Update the base system
# All of this stuff should get moved to the base box eventually


# Get detarpm first, so we can download less stuff
yum install -y deltarpm

# Get the latest stuff
yum -y update


#VM stuff
yum install -y chrony

#Ops stuff
yum install -y epel-release nload htop iostat psmisc iotop yum-cron policycoreutils-python

#Dev stuff
yum install -y git wget curl tree emacs-nox vim ack tmux screen lynx links



