# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # from Vagrant cloud
  config.vm.box = "marcpascual/base-centos7"

  # jenkins master
  config.vm.define "master" do |master|

    master.vm.network "private_network",
      ip: "192.168.56.11",
      netmask: "255.255.255.0",
      dhcp_enabled: false,
      nic_type: "virtio",
      forward_mode: "none"
 
    master.vm.provider "virtualbox" do |vb|
      vb.name = "jenkins-master"
      vb.linked_clone = true
      vb.memory = "2048"
      vb.cpus = 2
      vb.default_nic_type = "virtio"
    end

    master.vm.provision "shell", inline: <<-SHELL
      hostnamectl set-hostname jenkins-master
      wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
      rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
      yum -y install jenkins
      systemctl enable jenkins
      systemctl start jenkins
    SHELL
  end

  # jenkins-slave1
  config.vm.define "slave1" do |slave1|

    slave1.vm.network "private_network",
      ip: "192.168.56.12",
      netmask: "255.255.255.0",
      dhcp_enabled: false,
      nic_type: "virtio",
      forward_mode: "none"
 
    slave1.vm.provider "virtualbox" do |vb|
      vb.name = "jenkins-slave1"
      vb.linked_clone = true
      vb.memory = "2048"
      vb.cpus = 2
      vb.default_nic_type = "virtio"
    end

    slave1.vm.provision "shell", inline: <<-SHELL
      hostnamectl set-hostname jenkins-slave1
    SHELL
  end
end

