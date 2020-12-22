# Bash
<!--ts-->
   * [Bash](#bash)
      * [remove empty lines](#remove-empty-lines)

<!-- Added by: morelly_t1, at: Tue 22 Dec 2020 02:43:27 PM CET -->

<!--te-->

## remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```
