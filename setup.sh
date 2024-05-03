#!/bin/bash

# Update and install curl
sudo apt-get update && sudo apt-get install -y curl

# Install Kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl

# Install Helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update && sudo apt-get install -y helm

# Install K3s
curl -sfL https://get.k3s.io | sh -

# Set Kubeconfig environment variable
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> $HOME/.bashrc
source $HOME/.bashrc

chmod +x /etc/rancher/k3s/k3s.yaml
