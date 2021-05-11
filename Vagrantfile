# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
#  could not get it worked, config.disksize.size disabled
  # in case plugins are not installed automatically,
  # try to run it manually via command line:
  # $ vagrant plugin install vagrant-disksize
  config.vagrant.plugins = ["vagrant-disksize"]

# list of vm.boxes: https://app.vagrantup.com/boxes/search
  #config.vm.box = "ubuntu/focal64"
  config.vm.box = "ubuntu/bionic64"

# works only with vagrant-disksize, which was not installed:
# https://github.com/hashicorp/vagrant/issues/10826 but for vagrant-disksize
  config.disksize.size = '10GB'

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # allows host-only access to the machine
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Ubuntu Dev Desktop Environment"
    vb.gui = true
    vb.memory = 1000
    vb.cpus = 2
    vb.customize [
      "modifyvm", :id,
      "--vram", "256",
      '--clipboard', 'bidirectional'
    ]
  end

  # Install ansible on guest, but not on the host machine:
  config.vm.provision "install", type: "ansible_local" do |ansible|
      ansible.verbose = true
      ansible.verbose = "-v"
      ansible.playbook = "playbooks/installDevEnv.yml"
      ansible.install_mode = "pip"
      ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
  end

  # Install ansible on guest, but not on the host machine:
  config.vm.provision "git", run: "never", type: "ansible_local" do |ansible|
      ansible.verbose = true
      #ansible.verbose = "-vvv"
      ansible.playbook = "git_projects/playbook.yml"
      ansible.install_mode = "pip"
      ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
  end

end
