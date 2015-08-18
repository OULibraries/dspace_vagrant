# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|


  config.ssh.forward_agent = true

  config.vm.box = "vmware-centos71"
  config.vm.hostname = "ouatio.vm.test"


  # Use NFS 
  config.vm.synced_folder ".", "/vagrant", type: "nfs"



  # Configure DSpace system Requirements
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "4096"
  end

  home_dir = "/home/vagrant"

 config.vm.provision :shell, :path => "./scripts/bootstrap.sh", :args => home_dir
 config.vm.provision :shell, :path => "./scripts/dependencies.sh", :args => home_dir
 config.vm.provision :shell, :path => "./scripts/ouatio-db.sh", :args => home_dir
 # Interaction with GitHub needs to be done as vagrant user because
 # ssh agent forwarding works if we do it that way 
 config.vm.provision :shell, :path => "./scripts/ouatio-github.sh", :args => home_dir, :privileged => FALSE
 config.vm.provision :shell, :path => "./scripts/ouatio-dspace.sh", :args => home_dir
 config.vm.provision :shell, :path => "./scripts/ouatio-drupal.sh", :args => home_dir

end