# Linux
<!--ts-->
   * [Linux](#linux)
      * [DNS](#dns)
         * [Ovierview DNS Records](#ovierview-dns-records)
         * [/etc/nsswitch.conf](#etcnsswitchconf)
      * [RHEL](#rhel)
         * [Change Timezone](#change-timezone)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 07:53:58 PM CET -->

<!--te-->

## DNS
### Ovierview DNS Records 
* A-Record: Domain Name -> IPv4
* AAAA-Record: Domain-Name -> IPv6
* CNAME: Domain-Name -> Domain Name (Alias)

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
