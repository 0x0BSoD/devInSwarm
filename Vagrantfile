# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos_8"
  
  config.ssh.password = 'vagrant'
  config.ssh.keys_only = false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end

  config.vm.define "swarm-node-manager" do |box|
    box.vm.hostname = "swarm-node-manager"
    box.vm.network "public_network", ip: "10.1.1.100", netmask:"255.255.0.0", bridge: "Intel(R) Wi-Fi 6 AX201 160MHz"
  end

  (1..3).each do |i|
    config.vm.define "swarm-node-#{i}" do |box|
      box.vm.hostname = "swarm-node-#{i}"
      box.vm.network "public_network", ip: "10.1.1.10#{i}", netmask:"255.255.0.0", bridge: "Intel(R) Wi-Fi 6 AX201 160MHz"
    end
  end

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    SHELL
  end

end
