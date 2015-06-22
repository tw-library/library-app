# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false

  config.vm.network :private_network, ip: "192.168.33.8"
  config.vm.network :forwarded_port, guest: 8080, host: 8090
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.synced_folder ".", "/app"

  config.vm.define :libraryapi do |api|
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
  end
end
