# bash into container
```
docker run --name rpm_test --rm -it centos bash
```

# build -> tag -> push image
```
docker build -t go-tito .
docker tag go-tito:latest registry.labwi.sva.de/tom.morelly/go-tito:latest
docker push registry.labwi.sva.de/tom.morelly/go-tito:latest
```
