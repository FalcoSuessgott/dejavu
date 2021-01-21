#!/usr/bin/env bash
preview="grep -Ril {} | xargs cat | sed -n "/{}/,/#/p" | sed '1d;$d'"
cat $PWD/**/*.md | grep "^###" | cut -d " " -f2- | fzf --preview="$preview"

