Vagrant.configure("2") do |config|
  config.vm.box = "centos65-x86_64-20131205"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
  config.vm.provision "shell", path: "bootstrap/install-tools.sh"

  config.vm.define "master" do |master|
    master.vm.hostname = "phoenix-master.local"
    master.vm.network "private_network", ip: "192.168.56.202"
    master.vm.provision "shell", path: "bootstrap/create-yum-repository.sh"
  end

  config.vm.define "node" do |node|
    node.vm.hostname = "phoenix-node-1.local"
    node.vm.network "private_network", ip: "192.168.56.203"
    node.vm.provision "shell" do |shell|
      shell.path = "bootstrap/clone-modules.sh"
      shell.args = [ "https://github.com/thephoenixproject/phoenix-modules.git" ]
    end
    node.vm.provision "shell", inline: "echo '192.168.56.202 phoenix-master phoenix-master.local' >> /etc/hosts"
  end
end