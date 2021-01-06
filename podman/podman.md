# Podman
<!--ts-->
   * [Podman](#podman)
      * [Generate Systemd File for Pod/Container](#generate-systemd-file-for-podcontainer)

<!-- Added by: morelly_t1, at: Wed 06 Jan 2021 04:07:51 PM CET -->

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
