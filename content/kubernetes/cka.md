---
title: "cka"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

### setup 
```bash
# .bashrc
alias k=kubectl
export do="--dry-run=client -o yaml"

source .bashrc

# .vimrc
set tabstop=2
set expandtab

# autocompletion
source <(kubectl completion bash)
complete -F __start_kubectl k # to make it work with the alias k
sudo apt-get install bash-completion
source ~/.bashrc
```

### get context-names
```bash
$> k config get-contexts -o name
```

### create pod on master although NoSchedule
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: pod1
  name: pod1
spec:
  containers:
  - image: httpd:2.4.41-alpine
    name: pod1-container                  # change
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  tolerations:                            # add
  - effect: NoSchedule                    # add
    key: node-role.kubernetes.io/master   # add
  nodeSelector:                           # add
    node-role.kubernetes.io/master: ""    # add
status: {}
```

### scale down StatefulSet
```bash
$> k -n project-c13 scale sts o3db --replicas 1 --record  # --record creates an annotation
statefulset.apps/o3db scaled
```

### liveness & readyness probe
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ready-if-service-ready
  name: ready-if-service-ready
spec:
  containers:
  - image: nginx:1.16.1-alpine
    name: ready-if-service-ready
    resources: {}
    livenessProbe:                               # add from here
      exec:
        command:
        - 'true'
    readinessProbe:
      exec:
        command:
        - sh
        - -c
        - 'wget -T2 -O- http://service-am-i-ready:80'   # to here
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

### sorting pod by metadata
```bash
kubectl get pod -A --sort-by=.metadata.creationTimestamp
kubectl get pod -A --sort-by=.metadata.uid
```

### using volume in deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: safari
  name: safari
  namespace: project-tiger
spec:
  replicas: 1
  selector:
    matchLabels:
      app: safari
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: safari
    spec:
      volumes:                                      # add
      - name: data                                  # add
        persistentVolumeClaim:                      # add
          claimName: safari-pvc                     # add
      containers:
      - image: httpd:2.4.41-alpine
        name: container
        volumeMounts:                               # add
        - name: data                                # add
          mountPath: /tmp/safari-data               # add
```

### node on pod ressource
```bash
# kubectl top wasnt available but it still the valid answer...
kubectl top node
kubectl top pod --containers=true
```

### pod to node without scheduler
* k get $POD $do 
* then add spec.nodeName in manifest
* delete and recreate pod 

### rbac
```bash
$> k -n project-hamster create sa processor 
serviceaccount/processor created
$> k -n project-hamster create role processor \
  --verb=create \
  --resource=secret \
  --resource=configmap  # no comma separated!
$> k -n project-hamster create rolebinding processor \
  --role processor \
  --serviceaccount project-hamster:processor
$> k -n project-hamster auth can-i create secret \
  --as system:serviceaccount:project-hamster:processor # verify
```

### daemonSet
* There should be only ever one Pod of that Deployment running on one worker node:
```yaml
spec:
      containers:
      - image: nginx:1.17.6-alpine
        name: container1                # change
        resources: {}
      - image: kubernetes/pause         # add
        name: container2                # add
      affinity:                                             # add
        podAntiAffinity:                                    # add
          requiredDuringSchedulingIgnoredDuringExecution:   # add
          - labelSelector:                                  # add
              matchExpressions:                             # add
              - key: id                                     # add
                operator: In                                # add
                values:                                     # add
                - very-important                            # add
            topologyKey: kubernetes.io/hostname             # add
```

### pod shared volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: multi-container-playground
  name: multi-container-playground
spec:
  containers:
  - image: nginx:1.17.6-alpine
    name: c1                                                                      # change
    env:                                                                          # add
    - name: MY_NODE_NAME                                                          # add
      valueFrom:                                                                  # add
        fieldRef:                                                                 # add
          fieldPath: spec.nodeName                                                # add
    volumeMounts:                                                                 # add
    - name: vol                                                                   # add
      mountPath: /vol                                                             # add
  - image: busybox:1.31.1                                                         # add
    name: c2                                                                      # add
    command: ["sh", "-c", "while true; do date >> /vol/date.log; sleep 1; done"]  # add
    volumeMounts:                                                                 # add
    - name: vol                                                                   # add
      mountPath: /vol                                                             # add
  - image: busybox:1.31.1                                                         # add
    name: c3                                                                      # add
    command: ["sh", "-c", "tail -f /vol/date.log"]                                # add
    volumeMounts:                                                                 # add
    - name: vol                                                                   # add
      mountPath: /vol                                                             # add
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  volumes:                                                                        # add
    - name: vol                                                                   # add
      emptyDir: {}                                                                # add
```
verify
```bash
k exec multi-container-playground -c c1 -- env | grep MY
```

### cluster-info
* get PodCIDR
```bash
k describe node | less -p PodCIDR
```

* get service CIDR
```bash
cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep range
```

* CNI Config file
```bash
find /etc/cni/net.d/
cat /etc/cni/net.d/10-weave.conflist
```

### event logging
```bash
kubectl get events -A --sort-by=.metadata.creationTimestamp
```

### namespaced ressources
```bash
k api-resources --namespaced -o name
```

* ns with most roles
```bash
# for each ns 
k -n project-c13 get role --no-headers | wc -l
```

### create secret
```bash
k -n secret create secret generic secret2 --from-literal=user=user1 --from-literal=pass=1234
```

mount secret into pod

```yaml
...
env:                                  # add
    - name: APP_USER                      # add
      valueFrom:                          # add
        secretKeyRef:                     # add
          name: secret2                   # add
          key: user                       # add
    - name: APP_PASS                      # add
      valueFrom:                          # add
        secretKeyRef:                     # add
          name: secret2                   # add
          key: pass                       #
 volumeMounts:                         # add
    - name: secret1                       # add
      mountPath: /tmp/secret1             # add
      readOnly: true                      # add
...
```

* verify:
```bash
$> k -n secret exec secret-pod -- env | grep APP
APP_PASS=1234
APP_USER=user1
$> k -n secret exec secret-pod -- find /tmp/secret1
/tmp/secret1
/tmp/secret1/..data
/tmp/secret1/halt
/tmp/secret1/..2019_12_08_12_15_39.463036797
/tmp/secret1/..2019_12_08_12_15_39.463036797/halt
$> k -n secret exec secret-pod -- cat /tmp/secret1/halt
```


### update node
```bash
kubeadm version
kubectl version
kubelet --version
kubeadm upgrade node # fails
apt-cache show kubectl | grep 1.20
apt-get install kubectl=1.20.1-00 kubelet=1.20.1-00
kubectl version --client # verify
systemctl restart kubelet
kubeadm token create --print-join-command # on master
kubeadm token list # on master
kubeadm join 192.168.100.31:6443 --token a4h78k.qiebc2j7s8x47tbb     --discovery-token-ca-cert-hash  # on worker
kubeadm reset # in case of troubles
kubectl get nodes # veriy
```

### certificate validity
```bash
$> openssl x509  -noout -text -in /etc/kubernetes/pki/apiserver.crt | grep Validity -A2
```

### client/server info
```bash
# client
$> openssl x509  -noout -text -in /var/lib/kubelet/pki/kubelet-client-current.pem | grep Issuer
$> openssl x509  -noout -text -in /var/lib/kubelet/pki/kubelet-client-current.pem | grep "Extended Key Usage" -A1
# server
$> openssl x509  -noout -text -in /var/lib/kubelet/pki/kubelet.crt | grep Issuer
$> openssl x509  -noout -text -in /var/lib/kubelet/pki/kubelet.crt | grep "Extended Key Usage" -A1
```

### network policy
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: np-backend
  namespace: project-snake
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
    - Egress                    # policy is only about Egress
  egress:
    -                           # first rule
      to:                           # first condition "to"
      - podSelector:
          matchLabels:
            app: db1
      ports:                        # second condition "port"
      - protocol: TCP
        port: 1111
    -                           # second rule
      to:                           # first condition "to"
      - podSelector:
          matchLabels:
            app: db2
      ports:                        # second condition "port"
      - protocol: TCP
        port: 2222
```
* verify
```bash
$> k -n project-snake exec backend-0 -- curl -s 10.44.0.25:1111
database one
```

### etcd backup
```bash
# find auth from etcd systemd/ static pod manifest
# save
ETCDCTL_API=3 etcdctl snapshot save /tmp/etcd-backup.db \
--cacert /etc/kubernetes/pki/etcd/ca.crt \
--cert /etc/kubernetes/pki/etcd/server.crt \
--key /etc/kubernetes/pki/etcd/server.key

# restore
ETCDCTL_API=3 etcdctl snapshot restore /tmp/etcd-backup.db --data-dir /var/lib/etcd-backup
# update etcd manifest using data-dir
```
