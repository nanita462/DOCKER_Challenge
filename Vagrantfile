# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  #config.vm.box_download_insecure = true
  config.vm.network "private_network", ip: "192.168.56.101"
  config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.network "forwarded_port", guest: 82, host: 8082
  config.vm.network "forwarded_port", guest: 22, host: 2222
  config.vm.network "forwarded_port", guest: 8080, host: 1234
  config.vm.network "forwarded_port", guest: 3000, host: 1256
  config.vm.network "forwarded_port", guest: 4000, host: 1257
  config.vm.network "forwarded_port", guest: 9999, host: 1258
  config.vm.network "forwarded_port", guest: 9090, host: 1259
  config.vm.network "forwarded_port", guest: 9000, host: 1251
  config.vm.network "forwarded_port", guest: 3306, host: 1260 #mysql
  config.vm.network "forwarded_port", guest: 27017, host: 1261 #mongo
  config.vm.hostname = "nanita462" 
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.disk :disk, size: "50GB", primary: true
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = "2"
     vb.name = "nanita462"
  end

  config.vm.provision "shell", inline: <<-SHELL
      echo "-------------------- Updating package lists"
      sudo apt-get update -y
      echo "-------------------- Installing supporting software"
      sudo apt-get install software-properties-common
      echo "-------------------- Adding Deadsnakes PPA"
      sudo add-apt-repository -y ppa:deadsnakes/ppa
      sudo apt-get update -y
      echo "-------------------- Installing required packages"
      sudo apt-get install -y python3.10 python3-pip python-is-python3 libpq-dev wget curl git vim make tree ca-certificates gnupg lsb-release ssh net-tools nano
      echo "-------------------- Installing Docker&Docker-compose"
      sudo apt-get install -y docker.io
      usermod -aG docker vagrant
      docker run hello-world 
      curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
  SHELL
end