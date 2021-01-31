---
title: "Docker"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->
   * [Docker](#docker)
      * [bash into container](#bash-into-container)
      * [build -&gt; tag -&gt; push image](#build---tag---push-image)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:26 PM CET -->

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
