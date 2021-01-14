# Vim
<!--ts-->
   * [Vim](#vim)
      * [display tab and whitespaces](#display-tab-and-whitespaces)
      * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Thu 14 Jan 2021 03:05:18 PM CET -->

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
