# Bash
<!--ts-->
   * [Bash](#bash)
      * [remove empty lines](#remove-empty-lines)
         * [insert/replace directly in file](#insertreplace-directly-in-file)

<!-- Added by: morelly_t1, at: Mon 11 Jan 2021 10:19:22 AM CET -->

<!--te-->

## remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```

### insert/replace directly in file
```bash
sed -i '/^[[:space:]]*$/d' FILE
```
