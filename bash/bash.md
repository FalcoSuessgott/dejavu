# Bash
<!--ts-->
   * [Bash](#bash)
      * [remove empty lines](#remove-empty-lines)
         * [insert/replace directly in file](#insertreplace-directly-in-file)

<!-- Added by: morelly_t1, at: Tue 22 Dec 2020 02:45:50 PM CET -->

<!--te-->

## remove empty lines
```bash
sed '/^[[:space:]]*$/d' FILE
```

### insert/replace directly in file
```bash
sed -i '/^[[:space:]]*$/d' FILE
```
