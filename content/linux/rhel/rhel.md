---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
---

<!--ts-->
   * [Linux](#linux)
      * [General](#general)
         * [get process listening on port](#get-process-listening-on-port)
      * [DNS](#dns)
         * [Ovierview DNS Records](#ovierview-dns-records)
         * [get public ip](#get-public-ip)
         * [/etc/nsswitch.conf](#etcnsswitchconf)
      * [RHEL](#rhel)
         * [Change Timezone](#change-timezone)
         * [open port using firewalld](#open-port-using-firewalld)
         * [list all version of rpm](#list-all-version-of-rpm)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:27 PM CET -->

<!--te-->
### Change Timezone
```bash
timedatectl list-timezones
timedatectl set-timezone Europa/Berlin
```

### open port using `firewalld`
```bash
sudo firewall-cmd --zone=public --permanent --add-port 6052/tcp
sudo firewall-cmd --reload
```

### list all version of rpm
```bash
$> yum list cloud-init --showduplicates
Installed Packages
cloud-init.x86_64                            19.4-7.el7.centos.3                            @updates
Available Packages
cloud-init.x86_64                            19.4-7.el7.centos                              base
cloud-init.x86_64                            19.4-7.el7.centos.2                            updates
cloud-init.x86_64                            19.4-7.el7.centos.3                            update
```
