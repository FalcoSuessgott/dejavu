---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->


<!-- Added by: morelly_t1, at: Fri 05 Mar 2021 08:37:27 PM CET -->

<!--te-->

### remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```

### insert/replace directly in file
```bash
sed -i '/^[[:space:]]*$/d' FILE
```

### test port connection
```bash
$> nc -vz 10.244.1.4 3306
Connection to 10.244.1.4 3306 port [tcp/mysql] succeeded!
```

### recursive find and replace
```bash
find . -type f -name "*.go" -print0 | xargs -0 sed -i '' -e 's/this/that/g'
```
