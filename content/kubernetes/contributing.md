---
title: "contributing"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

### build X
```bash
cd kubernetes
make WHAT=cmd/kubectl
./_output/bin/kubectl
```
### test X
```bash
cd kubernetes
# k8s.io/kubernetes added automatically
make WHAT=./pkg/kubectl
```
