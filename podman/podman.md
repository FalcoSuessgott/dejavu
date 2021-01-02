# Podman
<!--ts-->
   * [Podman](#podman)
      * [Generate Systemd File for Pod/Container](#generate-systemd-file-for-podcontainer)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 07:53:58 PM CET -->

<!--te-->
---
## Generate Systemd File for Pod/Container
```bash
podman run $container
podman generate systemd $container > $container.service
mv $container.service ~/.config/systemd/user/.
systemctl --user daemon-reload
systemctl --user start $container.service
```
