<!--ts-->
   * [Terms](#terms)
   * [default manifest yml](#default-manifest-yml)
   * [auto generate pod manifest](#auto-generate-pod-manifest)
   * [update replicaset](#update-replicaset)

<!-- Added by: morelly_t1, at: Sat 31 Oct 2020 12:17:30 PM CET -->

<!--te-->

# Terms
* Pod: the smallest deployable units of computing that you can create and manage in Kubernetes 
* ReplicaSet: A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time

# default manifest yml
```
version:
kind:
metadata:
spec:
```

# auto generate pod manifest
```
kubectl run redis --image=redis123 --dry-run=client -o yaml > pod.yml
```

# update replicaset
```
kubectl replace -f replica-definition.yml
```

