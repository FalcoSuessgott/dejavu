
---
title: "Podman"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---

<!--ts-->


<!-- Added by: morelly_t1, at: Fri 05 Mar 2021 08:37:28 PM CET -->

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
