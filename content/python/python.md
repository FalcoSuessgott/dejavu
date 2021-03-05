---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---
<!--ts-->


<!-- Added by: morelly_t1, at: Fri 05 Mar 2021 08:37:32 PM CET -->

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
