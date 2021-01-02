# Vim
<!--ts-->
   * [Vim](#vim)
      * [display tab and whitespaces](#display-tab-and-whitespaces)
      * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Sat 02 Jan 2021 09:04:26 PM CET -->

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
