---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->


<!-- Added by: morelly_t1, at: Fri 12 Feb 2021 02:44:40 PM CET -->

<!--te-->
## Go Install
### Test go get via docker
```bash
docker run --rm centos:latest bash -c "yum install -y git && curl -sL https://git.io/vQhTU | bash && source /root/.bashrc && go get github.com/FalcoSuessgott/tago && tago --version"
```

as alias in `.bash_profile`
```bash
goinstall(){
  docker run --rm centos:latest bash -c "yum install -y git && curl -sL https://git.io/vQhTU | bash && source /root/.bashrc && go get github.com/$1 && $(echo $1 | cut -d "/" -f2) --version"
}
```

`goinstall FalcoSuessgott/tago`

## Slice/Arrays
### Sort Slice of struct
```go
sort.Slice(planets[:], func(i, j int) bool {
  return planets[i].Axis < planets[j].Axis
})
```

### Sort by time
```go
sort.Slice(g.Tags, func(i, j int) bool {
    return g.Tags[i].Date.Before(g.Tags[j].Date)
})
```
