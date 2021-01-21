# Linux
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


## RHEL
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
