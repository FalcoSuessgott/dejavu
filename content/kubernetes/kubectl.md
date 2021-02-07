---
title: "kubectl"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->
   * [Kubernetes](#kubernetes)
      * [kubectl](#kubectl)
         * [apply changes](#apply-changes)
         * [create objects](#create-objects)
         * [get multiple objects](#get-multiple-objects)
         * [delete all pods in certain namespace](#delete-all-pods-in-certain-namespace)
      * [ooa](#ooa)
      * [General](#general)
         * [Required Ports control plane](#required-ports-control-plane)
         * [Worker Nodes](#worker-nodes)
         * [etcd ports](#etcd-ports)
         * [default manifest yml](#default-manifest-yml)
         * [get possible defintion options](#get-possible-defintion-options)
         * [version differences](#version-differences)
         * [auto generate a manifest](#auto-generate-a-manifest)
      * [kubectl via ssh jump host](#kubectl-via-ssh-jump-host)
      * [Pods](#pods)
         * [Default Pod ressources](#default-pod-ressources)
         * [create and expose a pod](#create-and-expose-a-pod)
         * [Static Pod](#static-pod)
      * [ReplicaSet](#replicaset)
         * [update replicaset](#update-replicaset)
      * [Deployments](#deployments)
         * [Create Deployment and scale it](#create-deployment-and-scale-it)
      * [Maintenance](#maintenance)
         * [drain a node](#drain-a-node)
         * [mark a node as unscheduable](#mark-a-node-as-unscheduable)
      * [DaemonSets](#daemonsets)
      * [Namespace](#namespace)
         * [get all namespaces](#get-all-namespaces)
         * [change namespace](#change-namespace)
      * [Service](#service)
         * [expose a pod on a specific port](#expose-a-pod-on-a-specific-port)
         * [Types](#types)
      * [DNS](#dns)
         * [CoreDNS](#coredns)
         * [FQDN](#fqdn)
      * [etcd](#etcd)
      * [Taint &amp; Tolerations](#taint--tolerations)
         * [add taint to node](#add-taint-to-node)
         * [remove taint of node](#remove-taint-of-node)
         * [tolerant specification](#tolerant-specification)
      * [Upgrade](#upgrade)
         * [prepare node for upgrades](#prepare-node-for-upgrades)
         * [using kubeadm](#using-kubeadm)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:27 PM CET -->

<!--te-->
### apply changes
```bash
kubectl apply -f file.yml
```

### create objects
```bash
kubectl create -f file.yml
```

### get multiple objects
```bash
kubectl get pods,svc,pvc,pv
```

### delete all pods in certain namespace
```bash
for pod in $(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' -n flux); do kubectl delete pod $pod -n flux; done
```

### debug services
```bash
kubectl run test --image=busybox:1.28 --rm --it -- nc -zvw 2 $SVC $PORT
```

### kubectl via ssh jump host
* cp .kube/config to local machine
* change server to localhost:6443
* add insecure-skip-tls-verify: true in cluster 
* remove cert
* ssh 10.25.112.158 -i priv_key -L 6443:localhost:6443

### export object
```bash
kubectl get svc service -o yaml > service.yml
```

### run command in container
```bash
kubectl run temp --image=busybox:1.28 --rm --it -- hostname -f 
```

### get apiversion
`kubectl api-versions | grep -i network`


### test kubeconfig
` kubectl cluster-info --kubeconfig=$PATH`

### get network policy
```bash
kubectl get netpol # default-deny
kubectl describe netpol default-deny
kubectl 
```
