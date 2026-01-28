Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian12"
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
    vb.name = "sqlite-builder"
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y python3-pip
    sudo pip3 install ansible
  SHELL
end