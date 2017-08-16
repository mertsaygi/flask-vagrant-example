# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 5050, host: 18080
  config.vm.hostname = "vagrant-test"
  config.vm.provision :puppet do |puppet|
  	puppet.module_path = "modules"
    puppet.options="--verbose --debug"
  end
end