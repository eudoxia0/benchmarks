# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/benchmarks"
  config.vm.provision "shell", path: "setup.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
end
