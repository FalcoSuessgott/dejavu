# Bash
<!--ts-->
   * [Bash](#bash)
      * [remove empty lines](#remove-empty-lines)
         * [insert/replace directly in file](#insertreplace-directly-in-file)

<!-- Added by: morelly_t1, at: Wed 06 Jan 2021 04:07:49 PM CET -->

<!--te-->

## remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```

### insert/replace directly in file
```bash
sed -i '/^[[:space:]]*$/d' FILE
```
