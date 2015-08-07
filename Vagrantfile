# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |box|
    box.memory = 1024
    box.cpus = 2
  end

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "192.168.33.8"
  config.vm.network :forwarded_port, guest: 8080, host: 8090
  config.vm.network :forwarded_port, guest: 9000, host: 9090
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.sudo = true
    ansible.verbose = "vvv"
  end
end
