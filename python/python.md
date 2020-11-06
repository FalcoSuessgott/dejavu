<!--ts-->
   * [pip module to rpm](#pip-module-to-rpm)
   * [short if else](#short-if-else)

<!-- Added by: morelly_t1, at: Thu 05 Nov 2020 01:57:17 PM CET -->

<!--te-->

# pip module to rpm
```
curl $PIP.tar.gz 
cd $PIP
python3 setup.py bdist_rpm
```

# short if else
```
x = "www-data" if distro == "debian" or distro == "ubuntu" else "apache"
```