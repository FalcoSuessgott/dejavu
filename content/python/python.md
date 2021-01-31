---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---
<!--ts-->
   * [Python](#python)
      * [pip module to rpm](#pip-module-to-rpm)
      * [short if else](#short-if-else)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:28 PM CET -->

<!--te-->

## pip module to rpm
```bash
curl $PIP.tar.gz 
cd $PIP
python3 setup.py bdist_rpm
```

## short if else
```python
x = "www-data" if distro == "debian" or distro == "ubuntu" else "apache"
```
