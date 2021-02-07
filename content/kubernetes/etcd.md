---
title: "etcd"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

### etcd leader election
* only on master out of all masters is the `active` (leader) master.
* the passive master redirect the write requests to the leader
* they check periodically the connection to each other
* the leader populates the received write requests to the other master, if the write request were successfully writen on more than 50% of the masters (2 out of 3), then the write operation is considered successfull
* if the leader goes down, the remaining master elect a new leader, having 3 masters, you can loose one and still be fine

### backup etcd
```bash
$> ETCDCTL_API=3 etcdctl --endpoints https://[127.0.0.1]:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/healthcheck-client.crt --key=/etc/kubernetes/pki/etcd/healthcheck-client.key snapshot save /opt/etcd-backup.db
```
