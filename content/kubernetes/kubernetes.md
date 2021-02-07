---
title: "General"
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

### delete all pods in certain namespace
```bash
for pod in $(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' -n flux); do kubectl delete pod $pod -n flux; done
```
ooa
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

### etcd ports
* TCP/2379 for client requests
* TCP/2380 for peer communication

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
### CoreDNS
* since v1.12 default dns server is CoreDNS
* deployed twice (HA) as pods in `kube-system` namespaces from a ReplicaSet via a Deployment
* service `kube-dns` automatically created at deployment
* CoreDNS main default config file:

`/etc/coredns/Corefile`
```yaml
    .:53 {
        errors
        health
        ready
        kubernetes <CLUSTER_DOMAIN> <REVERSE_ZONES...> {
          pods insecure
          fallthrough in-addr.arpa ip6.arpa
        }
        prometheus :9153
        forward . /etc/resolv.conf
        cache 30
        loop
        reload
        loadbalance
    }
```
### FQDN

| Hostname    | Namespace | Type | Suffix        | combined                           |
|-------------|-----------|------|---------------|------------------------------------|
| web-service | apps      | svc  | cluster.local | web-service.apps.svc.cluster.local |
| 10.244.2.5  | apps      | pod  | cluster.local | 10-244-2-5.apps.pod.cluster.local  |

---

## Taint & Tolerations
* Tolerations are applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints
* available effects: NoSchedule, PreferNoSchedule, NoExecute

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

## Auth
### SA flow
```bash
kubectl create serviceaccount pvviewer
kubectl create clusterrole pvviewer-role --resource=persistentvolumes --verb=list
kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default/pvviewer
# add spec.serviceAccountName: pvviewer in Podmanifest
# verify with kubectl describe pod xxx | grep SecretName
``` 

### CSR flow
create .key & .csr:
```bash
openssl genrsa -out john.key 2048
openssl req -new -key john.key -out john.csr
```

create csr request:
```yml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: john
spec:
  groups:
  - system:authenticated
  request: $(cat john.csr | base64 | tr -d "\n")
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
```

approve csr:
```bash
kubectl get csr
kubectl certificate approve john
kubectl get csr/john -o yaml
```

create role:
```bash
kubectl create role developer --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods
```

create rolebinding:
```bash
kubectl create rolebinding developer-binding-john --role=developer --user=john`
```
verify:
```
$> kubectl auth can-i update pods --namespace=development --as=john
yes
```

