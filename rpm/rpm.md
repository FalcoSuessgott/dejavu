# RPM
<!--ts-->
   * [RPM](#rpm)
      * [see if rpm files has been changed](#see-if-rpm-files-has-been-changed)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 09:04:26 PM CET -->

<!--te-->

## see if rpm files has been changed
```bash
rpm -qa | xargs rpm --verify --nomtime | less
```
