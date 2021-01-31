---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->
   * [Bash](#bash)
      * [remove empty lines](#remove-empty-lines)
         * [insert/replace directly in file](#insertreplace-directly-in-file)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:25 PM CET -->

<!--te-->

### remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```

### insert/replace directly in file
```bash
sed -i '/^[[:space:]]*$/d' FILE
```
