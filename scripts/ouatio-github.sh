#!/bin/bash


# Get the Ouatio DSpace Code
# This assumes that ssh keys with github are working
git clone git@github.com:OULibraries/ouatio_dspace /home/vagrant/ouatio_dspace

# Set some Git Setings
git config --global push.default simple


