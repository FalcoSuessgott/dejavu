---
title: "Docker"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->


<!-- Added by: morelly_t1, at: Fri 05 Mar 2021 08:37:28 PM CET -->

<!--te-->

### bash into container
```bash
docker run --name rpm_test --rm -it centos bash
```

### build -> tag -> push image
```bash
docker build -t go-tito .
docker tag go-tito:latest $REGISTRY/$USER/go-tito:latest
docker push $REGISTRY/$USER/go-tito:latest
```
