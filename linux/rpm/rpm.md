# Linux/RPM
<!--ts-->
<!--te-->

## see if rpm files has been changed
```bash
rpm -qa | xargs rpm --verify --nomtime | less
```
