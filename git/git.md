# Git
<!--ts-->
   * [Git](#git)
      * [delete local and remote tag](#delete-local-and-remote-tag)
      * [delete all local and remote tags](#delete-all-local-and-remote-tags)

<!-- Added by: morelly_t1, at: Mon 11 Jan 2021 10:19:23 AM CET -->

<!--te-->
---
## delete local and remote tag
```bash
git tag -d v1.1.0
git push --delete origin v1.1.0
```

## delete all local and remote tags
```bash
for tag in $(git tag -l); do git tag -d $tag && git push --delete origin $tag; done
```
