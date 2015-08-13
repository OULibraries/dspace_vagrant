# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "vmware-centos71"
  config.vm.hostname = "shareok.vm.test"


  # Use NFS 
  config.vm.synced_folder ".", "/vagrant", type: "nfs"


  
  # Configure System Requirements
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "4096"
  end





  
  home_dir = "/home/vagrant"

  config.vm.provision :shell, :path => "./scripts/bootstrap.sh", :args => home_dir
  config.vm.provision :shell, :path => "./scripts/ouatio.sh", :args => home_dir
  

end
