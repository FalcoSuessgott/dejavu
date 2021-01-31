
---
title: "Podman"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->
   * [Podman](#podman)
      * [Generate Systemd File for Pod/Container](#generate-systemd-file-for-podcontainer)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:27 PM CET -->

<!--te-->
---

### Generate Systemd File for Pod/Container
```bash
podman create -d $container $args
podman generate systemd $container > $container.service
mv $container.service ~/.config/systemd/user/.
systemctl --user daemon-reload
systemctl --user start $container.service
```
