# Go
<!--ts-->
   * [Go](#go)
   * [Slice/Arrays](#slicearrays)
      * [Sort Slice of struct](#sort-slice-of-struct)
      * [Sort by time](#sort-by-time)

<!-- Added by: morelly_t1, at: Thu 14 Jan 2021 03:05:12 PM CET -->

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
