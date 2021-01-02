# Ansible
<!--ts-->
   * [Ansible](#ansible)
      * [wait for SSH Connection](#wait-for-ssh-connection)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 09:04:23 PM CET -->

<!--te-->

## wait for SSH Connection
```yaml
  - name: Install k8s using kubespray
    hosts: all
    gather_facts: no

    pre_tasks:
    - name: Wait for SSH Connection
      wait_for_connection:
        delay: 10
        timeout: 300

    - name: Gathering facts
      setup:
```
