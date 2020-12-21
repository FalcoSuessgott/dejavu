<!--ts-->
   * [pip module to rpm](#pip-module-to-rpm)
   * [short if else](#short-if-else)

<!-- Added by: morelly_t1, at: Mon 21 Dec 2020 02:26:05 PM CET -->

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