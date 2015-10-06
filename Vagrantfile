# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|


  config.ssh.forward_agent = true

  config.vm.box = "ansible4devopsch2"
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

#  config.vm.provision :shell, :path => "./scripts/bootstrap.sh", :args => home_dir
#  config.vm.provision :shell, :path => "./scripts/bootstrap-vagrant.sh", :args => home_dir
#  config.vm.provision :shell, :path => "./scripts/dspace-db-vagrant.sh", :args => home_dir
#  config.vm.provision :shell, :path => "./scripts/shareok-3x.sh", :args => home_dir
 # Interaction with GitHub needs to be done as vagrant user because
 # ssh agent forwarding works if we do it that way 
# config.vm.provision :shell, :path => "./scripts/dspace-github.sh", :args => home_dir, :privileged => FALSE
# config.vm.provision :shell, :path => "./scripts/dspace-mirage2.sh", :args => home_dir, :privileged => FALSE
# config.vm.provision :shell, :path => "./scripts/dspace-java.sh", :args => home_dir
# config.vm.provision :shell, :path => "./scripts/dspace.sh", :args => home_dir
# config.vm.provision :shell, :path => "./scripts/shareok-3x-db.sh", :args => home_dir
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "shareok.yml"
  end
end
