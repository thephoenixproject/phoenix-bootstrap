Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  config.vm.box = "centos65-x86_64-20131205"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
  
  config.vm.define "master" do |master|
    master.vm.hostname = "phoenix-master.local"
    master.vm.network "private_network", ip: "192.168.56.202"
    master.vm.provision "shell", path: "bootstrap-master.sh"
  end

  config.vm.define "node" do |node|
    node.vm.hostname = "phoenix-node-1.local"
    node.vm.network "private_network", ip: "192.168.56.203"
    node.vm.provision "shell" do |shell|
      shell.path = "bootstrap-node.sh"
      shell.args = [
        "https://github.com/thephoenixproject/phoenix-node.git",
        "192.168.56.202",
        "phoenix-master"
      ]
    end
  end
end

