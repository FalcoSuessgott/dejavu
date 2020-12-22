# RPM
<!--ts-->
   * [RPM](#rpm)
      * [see if rpm files has been changed](#see-if-rpm-files-has-been-changed)

<!-- Added by: morelly_t1, at: Tue 22 Dec 2020 02:45:52 PM CET -->

<!--te-->

## see if rpm files has been changed
```bash
rpm -qa | xargs rpm --verify --nomtime | less
```
