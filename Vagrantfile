# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.hostname = "vagrant-test"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = ".puppet/modules"
    puppet.manifests_path=".puppet/manifests"
    puppet.options="--verbose --debug"
    puppet.facter = {
        "is_vagrant" => true,
    }
  end
end