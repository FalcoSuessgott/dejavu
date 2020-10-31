# auto generate pod manifest
```
kubectl run redis --image=redis123 --dry-run=client -o yaml > pod.yml
```

