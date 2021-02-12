---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

# Linux
<!--ts-->
   * [Linux](#linux)
      * [General](#general)
         * [get process listening on port](#get-process-listening-on-port)
      * [DNS](#dns)
         * [Ovierview DNS Records](#ovierview-dns-records)
         * [get public ip](#get-public-ip)
         * [/etc/nsswitch.conf](#etcnsswitchconf)

<!-- Added by: morelly_t1, at: Fri 12 Feb 2021 02:36:43 PM CET -->

<!--te-->
## General
### get process listening on port 
```bash
lsof -i :8080
COMMAND    PID       USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
java    931220 morelly_t1  200u  IPv6 3669215      0t0  TCP *:http-alt (LISTEN)
```
## DNS
### Ovierview DNS Records 
* A-Record: Domain Name -> IPv4
* AAAA-Record: Domain-Name -> IPv6
* CNAME: Domain-Name -> Domain Name (Alias)

### get public ip
```bash
$> curl ifconfig.me
109.90.5.242
```

### `/etc/nsswitch.conf`
controls the order and which services to use for name resolution
```
passwd:   files nis
group:    files nis

hosts:    files dns myhostname
```

* user information (the passwd and group services) come first from “files” (like /etc/passwd or /etc/group)
* if no entries are found there, a query to an NIS server (configured elsewhere) 
* Host information first comes from /etc/hosts (files), then a DNS server (dns), and if neither of those work, at least a fallback of “myhostname” so that the local machine has some name
