<!--ts-->
   * [display tab and whitespaces](#display-tab-and-whitespaces)
   * [delete everything after cursor](#delete-everything-after-cursor)

<!-- Added by: morelly_t1, at: Mon 21 Dec 2020 02:26:23 PM CET -->

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