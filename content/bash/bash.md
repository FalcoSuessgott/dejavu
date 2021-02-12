---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->
         * [remove empty lines](#remove-empty-lines)
         * [insert/replace directly in file](#insertreplace-directly-in-file)
         * [test port connection](#test-port-connection)

<!-- Added by: morelly_t1, at: Fri 12 Feb 2021 02:36:38 PM CET -->

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
