---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---
<!--ts-->
      * [pip module to rpm](#pip-module-to-rpm)
      * [short if else](#short-if-else)

<!-- Added by: morelly_t1, at: Fri 12 Feb 2021 02:36:44 PM CET -->

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
