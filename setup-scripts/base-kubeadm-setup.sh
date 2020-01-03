#!/bin/bash
set -eau
sudo rm -rf /var/lib/etcd
sudo kubeadm --pod-network-cidr=10.244.0.0/16 init
rm -rf $HOME/.kube/ && mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-

# Apply networking
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
