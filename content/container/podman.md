
---
title: "Podman"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->
         * [Generate Systemd File for Pod/Container](#generate-systemd-file-for-podcontainer)

<!-- Added by: morelly_t1, at: Fri 12 Feb 2021 02:36:39 PM CET -->

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
