# Development Environment for Ouatio

Requires:
* key-based access to the private ouatio_vagrant git repository. (Which is just a copy of the DSpace 5.3 release that we configured and checked in to GitHub.)
* a CentOS 7 vagrant base box for VMWare. There's a good setup for making one [here](https://github.com/geerlingguy/packer-centos-7/).


## Configuration

This environment can work for either OUatio or SHAREOK development. To configure for SHAREOK:

* in `.../etc` do `ln -s ./shareok.conf.sh ./conf.sh'
* in `.../etc/Catalina` do `ln -s ./shareok ./localhost`





