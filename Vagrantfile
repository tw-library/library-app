# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |box|
    box.memory = 2048
    box.cpus = 2
  end

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 8080, host: 8080 # API
  config.vm.network :forwarded_port, guest: 8081, host: 8081 # API DEBUG
  config.vm.network :forwarded_port, guest: 9000, host: 9000 # UI
  config.vm.network :forwarded_port, guest: 5432, host: 5432 # DATABASE
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.sudo = true
    ansible.verbose = "vvv"
  end
end
