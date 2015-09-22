# OU Repositories Development Environment for DSpace

Requires:
* key-based access to the private ouatio_vagrant git repository. (Which is just a copy of the DSpace 5.3 release that we configured and checked in to GitHub.)
* a CentOS 7 vagrant base box for VMWare. There's a good setup for making one [here](https://github.com/geerlingguy/packer-centos-7/).




## Configure and Install

This environment can work for either OUatio or SHAREOK development. To configure for SHAREOK:

* Clone the repo to an appropriate location: `git clone https://github.com/OULibraries/dspace_vagrant shareok_vagrant`
* in `.../etc` do `ln -s ./shareok.conf.sh ./conf.sh`
* in `.../etc/Catalina` do `ln -s ./shareok ./localhost`
* build the vm with `vagrant up --provider=vmware_fusion`
* run `sudo /srv/shareok/dspace create-administrator` to create a local admin user

There is an unresolved issue in DSpace 5.x that can cause DSpace to be unable to create an admin user when first installed. See [the ticket](https://jira.duraspace.org/browse/DS-2408) for the issue for more inforamtion. If you run in to this problem, you can use `dspace database clean` to erase the DSpace database, and then re-run `dspace create-administrator`, which will cause the database to be reinitialized correctly. 

After sucessfully building a VM, you will find:

* DSpace will be installed and running from a project folder under /srv
* the DSpace src will be located in the /vagrant folder (shared from the host computer)



To configure for OUatio, substitute the OUatio configuration files. 









