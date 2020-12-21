<!--ts-->
   * [delete local and remote tag](#delete-local-and-remote-tag)
      * [delete all local and remote tags](#delete-all-local-and-remote-tags)

<!-- Added by: morelly_t1, at: Mon 21 Dec 2020 02:26:04 PM CET -->

<!--te-->
---
# delete local and remote tag
```
git tag -d v1.1.0
git push --delete origin v1.1.0
```

## delete all local and remote tags
```
for tag in $(git tag -l); do git tag -d $tag && git push --delete origin $tag; done
```