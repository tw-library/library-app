# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "library"

  config.vm.network :private_network, ip: "192.168.33.8"
  config.vm.network :forwarded_port, guest: 8080, host: 8099
  config.vm.network :forwarded_port, guest: 9000, host: 9009
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    # ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
    ansible.verbose = "vvv"
  end
end
