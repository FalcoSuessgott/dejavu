---
title: "General"
date: 2017-10-17T15:26:15Z
draft: false
weight: 40
---
<!--ts-->
   * [Vim](#vim)
      * [display tab and whitespaces](#display-tab-and-whitespaces)
      * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Thu 21 Jan 2021 10:14:29 PM CET -->

<!--te-->

### display tab and whitespaces
```vim
set list
set listchars=tab:>-
```

### delete everything after cursor
```vim
:$LINE_NUMBER
:dG # delete Global
```
