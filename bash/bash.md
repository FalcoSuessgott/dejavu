# Bash
<!--ts-->
   * [Bash](#bash)
      * [remove empty lines](#remove-empty-lines)
         * [insert/replace directly in file](#insertreplace-directly-in-file)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:25 PM CET -->

<!--te-->

## remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```

### insert/replace directly in file
```bash
sed -i '/^[[:space:]]*$/d' FILE
```
