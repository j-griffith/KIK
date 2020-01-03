# kik
kubernetes In kubernetes

## Huh?
A set of manifests to run a kubernetes on (in) a kubernetes cluster.  The goal being to use kubernetes to manage and run a kubernetes cluster.

## Overview
Uses kubevirt VMs as kubernetes nodes inside of a kubernetes cluster

* kubernetes cluster
*   Install Kubevirt
*   Install Container Data Importer
*   Create Data Volume for each virtual kubernetes node
*   Launch kubevirt VM using the created Data Volumes
*   Install kubeadm on all nodes (VMs) *
*   Iniitalize kubeadm on master node
*   Join worker nodes

Rather than launch kubevirt vm's and install kubeadm and doing all the setup manually, you'll want to create an image (iso, tar, qcow2 etc) that can then be imported as a data volume and then simply launched and use an init script to start and join nodes in a cluster.

Note that when using a storage backend that supports it, the CSI Clone feature along with the CDI service, make this process fairly simple and quick.

## Current status of this repo
Right now this is just a simple collection of example setup scripts and manifests that can be leveraged to try things out on your own.

Next steps will include dynamic manifest building based on env variables and ideally supplying a pre-installed kubeadm image to import and build off of.

In addition, I'm working on a Kubevirt Cluster API Provider as the final goal.  I'll provide a link here when I have something worth looking at.

## Caveats
Networking is hard!  Currently I'm using as simple a model as possible, I use flannel as the base kubernetes CNI, and then on the kubevirt VM nodes I use Flannel.  These two don't collide and seem to play nicely together.  I'm also using things like multus to try and sort out things like adding service IPs to the kubevirt nodes, and also to come up with ways to segregate data path traffic.
