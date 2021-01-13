# Go
<!--ts-->
   * [Go](#go)
      * [example](#example)

<!-- Added by: morelly_t1, at: Mon 11 Jan 2021 10:19:23 AM CET -->

<!--te-->
# Slice/Arrays
## Sort Slice of struct
```go
sort.Slice(planets[:], func(i, j int) bool {
  return planets[i].Axis < planets[j].Axis
})
```

## Sort by time
```go
sort.Slice(g.Tags, func(i, j int) bool {
    return g.Tags[i].Date.Before(g.Tags[j].Date)
})
```
