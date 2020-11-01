# ToC
<!--ts-->
   * [ToC](#toc)
   * [General](#general)
      * [default manifest yml](#default-manifest-yml)
      * [auto generate a manifest](#auto-generate-a-manifest)
   * [Pod](#pod)
      * [create and expose a pod](#create-and-expose-a-pod)
   * [ReplicaSet](#replicaset)
      * [update replicaset](#update-replicaset)
   * [Deployments](#deployments)
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

<!-- Added by: morelly_t1, at: Sun 01 Nov 2020 06:02:13 PM CET -->

<!--te-->

# General
## default manifest yml
```
version: v1
kind: Pod
metadata:

spec:

```

## auto generate a manifest 
```
kubectl run redis --image=redis123 --dry-run=client -o yaml > pod.yml
```
---
# Pod
>the smallest deployable units of computing that you can create and manage in Kubernetes 

## create and expose a pod
```
kubectl run httpd --image=httpd:alpine --port 80 --expose
```
---

# ReplicaSet
> A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time

## update replicaset
```
kubectl replace -f replica-definition.yml
```
---
# Deployments
> A Deployment provides declarative updates for Pods and ReplicaSets
---
# Namespace
> Kubernetes supports multiple virtual clusters backed by the same physical cluster. These virtual clusters are called namespaces.

## get all namespaces
```
kubectl get namespace
```
## change namespace
```
kubectl config set-context $(kubectl config current context) --namespace=prod
```
---
# Service
> to expose an application running on a set of Pods as a network service

## expose a pod on a specific port
```bash
kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort --dry-run=client -o yaml
```

## Types
* NodePort -> allocates a port from a range specified by --service-node-port-range
* LoadBalancer -> On cloud providers which support external load balancers, setting the type field to LoadBalancer provisions a load balancer for your Service.
* ClusterIP -> 
---
# DNS 
## FQDN
```
db-1.dev.svc.cluster.local
SERVICE.NAMESPACE.svc.cluster.local
```
---

# Taint & Tolerations
> Tolerations are applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints
> available effects: NoSchedule, PreferNoSchedule, NoExecute
## add taint to node
```
kubectl taint nodes node1 key=value:NoSchedule
```
## remove taint of node
```
kubectl taint nodes node1 key:NoSchedule-
```

## tolerant specification
```
tolerations:
- key: "key"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"
``` 

---