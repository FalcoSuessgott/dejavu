# RPM
<!--ts-->
   * [RPM](#rpm)
      * [see if rpm files has been changed](#see-if-rpm-files-has-been-changed)

<!-- Added by: morelly_t1, at: Wed 23 Dec 2020 02:15:40 PM CET -->

<!--te-->

## see if rpm files has been changed
```bash
rpm -qa | xargs rpm --verify --nomtime | less
```
