# Docker
<!--ts-->
   * [Docker](#docker)
      * [bash into container](#bash-into-container)
      * [build -&gt; tag -&gt; push image](#build---tag---push-image)

<!-- Added by: morelly_t1, at: Wed 06 Jan 2021 04:07:49 PM CET -->

<!--te-->

## bash into container
```bash
docker run --name rpm_test --rm -it centos bash
```

## build -> tag -> push image
```bash
docker build -t go-tito .
docker tag go-tito:latest $REGISTRY/$USER/go-tito:latest
docker push $REGISTRY/$USER/go-tito:latest
```
