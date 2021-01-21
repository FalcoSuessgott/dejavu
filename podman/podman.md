# Podman
<!--ts-->
   * [Podman](#podman)
      * [Generate Systemd File for Pod/Container](#generate-systemd-file-for-podcontainer)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:27 PM CET -->

<!--te-->
---
## Generate Systemd File for Pod/Container
```bash
podman create -d $container $args
podman generate systemd $container > $container.service
mv $container.service ~/.config/systemd/user/.
systemctl --user daemon-reload
systemctl --user start $container.service
```
