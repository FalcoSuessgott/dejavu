<!--ts-->
   * [display tab and whitespaces](#display-tab-and-whitespaces)
   * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Thu 05 Nov 2020 01:57:17 PM CET -->

<!--te-->

# display tab and whitespaces
```
set list
set listchars=tab:>-
```

# delete everything after cursor
```
:$LINE_NUMBER
:dG # delete Global
```