# Vim
<!--ts-->
   * [Vim](#vim)
      * [display tab and whitespaces](#display-tab-and-whitespaces)
      * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Tue 22 Dec 2020 03:04:03 PM CET -->

<!--te-->

## display tab and whitespaces
```vim
set list
set listchars=tab:>-
```

## delete everything after cursor
```vim
:$LINE_NUMBER
:dG # delete Global
```
