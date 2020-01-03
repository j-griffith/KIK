#!/bin/bash
set -eau
sudo rm -rf /var/lib/rook
sudo rm -rf /var/lib/etcd
sudo kubeadm init
rm -rf $HOME/.kube/ && mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-

# Apply networking
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
