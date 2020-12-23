# Kubernetes
<!--ts-->
   * [Kubernetes](#kubernetes)
      * [kubectl](#kubectl)
         * [apply changes](#apply-changes)
         * [create objects](#create-objects)
         * [get multiple objects](#get-multiple-objects)
      * [General](#general)
         * [Required Ports control plane](#required-ports-control-plane)
         * [Worker Nodes](#worker-nodes)
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
         * [FQDN](#fqdn)
      * [Taint &amp; Tolerations](#taint--tolerations)
         * [add taint to node](#add-taint-to-node)
         * [remove taint of node](#remove-taint-of-node)
         * [tolerant specification](#tolerant-specification)
      * [Upgrade](#upgrade)
         * [prepare node for upgrades](#prepare-node-for-upgrades)
         * [using kubeadm](#using-kubeadm)

<!-- Added by: morelly_t1, at: Wed 23 Dec 2020 02:15:39 PM CET -->

<!--te-->
## kubectl
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

---
## General
### Required Ports control plane
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#control-plane-node-s
| Protocol | Direction | Port Range | Purpose                 | Used by              |
|----------|-----------|------------|-------------------------|----------------------|
| TCP      | Inbound   | 6443       | Kubernetes API server   | All                  |
| TCP      | Inbound   | 2379-2380  | etcd server client API  | kube-apiserver, etcd |
| TCP      | Inbound   | 10250      | Kubelet API             | Self, Control plane  |
| TCP      | Inbound   | 10251      | kube-scheduler          | Self                 |
| TCP      | Inbound   | 10252      | kube-controller-manager | Self                 |

### Worker Nodes
| Protocol | Direction | Port Range  | Purpose           | Used by             |
|----------|-----------|-------------|-------------------|---------------------|
| TCP      | Inbound   | 10250       | Kubelet API       | Self, Control plane |
| TCP      | Inbound   | 30000-32767 | NodePort Services | All                 |

### default manifest yml
```bash
version: v1
kind: Pod
metadata:

spec:
```

### get possible defintion options
```bash
kubectl explain pod --recursivce | grep -A5 tolerations 
```

### version differences
kube-api server == X
controller manager >= X-1
kube-scheduler >= X-1
kubelet >= X-2
kube-proxy >= X-2
kubectly == x+1 || x-1


### auto generate a manifest 
```bash
kubectl run redis --image=redis123 --dry-run=client -o yaml > pod.yml
```
---

## kubectl via ssh jump host
* cp .kube/config to local machine
* change server to localhost:6443
* add insecure-skip-tls-verify: true in cluster 
* remove cert
* ssh 10.25.112.158 -i priv_key -L 6443:localhost:6443

## Pods
>the smallest deployable units of computing that you can create and manage in Kubernetes 

### Default Pod ressources
* 1 vCPU ( if Pod consumes more the pod will be throttled)
* 512 MB Memory (if Pod consumes more, the pod will be terminated)


### create and expose a pod
```bash
kubectl run httpd --image=httpd:alpine --port 80 --expose
```

### Static Pod
> Static Pods are managed directly by the kubelet daemon on a specific node, without the API server observing them.
---

## ReplicaSet
> A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time

### update replicaset
```bash
kubectl replace -f replica-definition.yml
```
---
## Deployments
> A Deployment provides declarative updates for Pods and ReplicaSets

### Create Deployment and scale it
```bash
kubectl create deployment blue --image=nginx 
kubectl scale deployment blue --replicas=6
```

---
## Maintenance
### drain a node
```bash
kubectl drain NODE
```

### mark a node as unscheduable
```bash
kubectl cordon node # remove with uncordon
```

## DaemonSets
> ensures that all (or some) Nodes run a copy of a Pod

---
## Namespace
> Kubernetes supports multiple virtual clusters backed by the same physical cluster. These virtual clusters are called namespaces.

### get all namespaces
```bash
kubectl get namespace
```
### change namespace
```bash
kubectl config set-context $(kubectl config current context) --namespace=prod
```
---

## Service
> to expose an application running on a set of Pods as a network service

### expose a pod on a specific port
```bash
kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort --dry-run=client -o yaml
```

### Types
* NodePort -> allocates a port from a range specified by --service-node-port-range
* LoadBalancer -> On cloud providers which support external load balancers, setting the type field to LoadBalancer provisions a load balancer for your Service.

* ClusterIP -> 
---

## DNS 
### FQDN
```bash
db-1.dev.svc.cluster.local
SERVICE.NAMESPACE.svc.cluster.local
```
---

## Taint & Tolerations
> Tolerations are applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints
> available effects: NoSchedule, PreferNoSchedule, NoExecute

### add taint to node
```bash
kubectl taint nodes node1 key=value:NoSchedule
```

### remove taint of node
```bash
kubectl taint nodes node1 key:NoSchedule-
```

### tolerant specification
```bash
tolerations:
- key: "key"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"
``` 

---
## Upgrade
### prepare node for upgrades
```bash
kubectl drain node01
kubectl cordono node01
```

### using kubeadm
```bash
kubeadm upgrade plan
kubeadm upgrade apply v1.18.0
```
