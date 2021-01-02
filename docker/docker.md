# Docker
<!--ts-->
   * [Docker](#docker)
      * [bash into container](#bash-into-container)
      * [build -&gt; tag -&gt; push image](#build---tag---push-image)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 09:04:23 PM CET -->

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
