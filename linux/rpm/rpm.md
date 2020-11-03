<!--ts-->
<!--te-->

# see if rpm files has been changed
```
rpm -qa | xargs rpm --verify --nomtime | less
```