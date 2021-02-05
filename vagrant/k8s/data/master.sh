#!/bin/bash

sudo kubeadm init --config=/mnt/host_data/kubeadm-init-config.yaml --upload-certs | tee kubeadm-init.out

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f /mnt/host_data/calico.yaml
echo "source <(kubectl completion bash)" >> $HOME/.bashrc
