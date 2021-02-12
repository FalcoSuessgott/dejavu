---
title: "kubectl"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->


<!-- Added by: morelly_t1, at: Fri 12 Feb 2021 02:44:41 PM CET -->

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
