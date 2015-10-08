# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|


  config.ssh.forward_agent = true

  config.vm.box = "geerlingguy/centos7"
  config.vm.hostname = "shareok3x.vm.test"
  config.vm.network "private_network", type: "dhcp"


  # Use NFS 
  config.vm.synced_folder ".", "/vagrant",
  :nfs => true,
  :mount_options => ['nolock,vers=3', 'udp', 'noatime']


  # Configure DSpace system Requirements
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "4096"
  end
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  home_dir = "/home/vagrant"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "shareok-vagrant.yml"
  end
end
