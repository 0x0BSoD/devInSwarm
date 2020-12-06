# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos_8"
  
  config.ssh.password = 'vagrant'
  config.ssh.keys_only = false
  # config.ssh.insert_key = false
  # config.ssh.private_key_path = "#{Dir.home}/.ssh/id_rsa.pub"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
  end

  managers = [
    { :name => "swarm-manager", :ip => "10.1.1.100" }
  ]

  workers = [
    { :name => "swarm-node-1", :ip => "10.1.1.101" },
    { :name => "swarm-node-2", :ip => "10.1.1.102" },
    { :name => "swarm-node-3", :ip => "10.1.1.103" },
  ]

  managers.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network "public_network", ip: opts[:ip], netmask:"255.255.0.0", bridge: "Intel(R) Wi-Fi 6 AX201 160MHz"
    end
  end

  workers.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network "public_network", ip: opts[:ip], netmask:"255.255.0.0", bridge: "Intel(R) Wi-Fi 6 AX201 160MHz"
    end
  end

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    SHELL
  end

end
