Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.provision "shell", path: "setup.sh" 

  # Forwarding the Kubernetes API server port to be accesed from the host
  config.vm.network "forwarded_port", guest: 6443, host: 6443
end
