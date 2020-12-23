# Vim
<!--ts-->
   * [Vim](#vim)
      * [display tab and whitespaces](#display-tab-and-whitespaces)
      * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Wed 23 Dec 2020 02:17:44 PM CET -->

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
