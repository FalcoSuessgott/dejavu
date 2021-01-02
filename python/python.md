# Python
<!--ts-->
   * [Python](#python)
      * [pip module to rpm](#pip-module-to-rpm)
      * [short if else](#short-if-else)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 09:04:25 PM CET -->

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
