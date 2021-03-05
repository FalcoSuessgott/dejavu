
---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---
<!--ts-->


<!-- Added by: morelly_t1, at: Fri 05 Mar 2021 08:37:28 PM CET -->

<!--te-->
---
### delete local and remote tag
```bash
git tag -d v1.1.0
git push --delete origin v1.1.0
```

### delete all local and remote tags
```bash
for tag in $(git tag -l); do git tag -d $tag && git push --delete origin $tag; done
```

### reset to commit
```bash
git reset --hard $tagname
```
