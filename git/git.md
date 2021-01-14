# Git
<!--ts-->
   * [Git](#git)
      * [delete local and remote tag](#delete-local-and-remote-tag)
      * [delete all local and remote tags](#delete-all-local-and-remote-tags)
      * [reset to commit](#reset-to-commit)

<!-- Added by: morelly_t1, at: Thu 14 Jan 2021 03:05:11 PM CET -->

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

## reset to commit
```bash
git reset --hard $tagname
```
