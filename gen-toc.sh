#!/usr/bin/env bash

[ $# -eq 0 ] && echo "no commit message provided." &&  exit 1

echo "Updating entries"
entries=$(grep -IiR --exclude-dir='.git' "^#" | wc -l)
sed -i"s/Entries: .*/Entries: $entries/" README.md

echo "building main ToC"

for file in **/*.md;do 
    gh-md-toc --insert "$file" 1>/dev/null && echo "build ToC for $file"
    rm "$file".* 2>/dev/null 
done
git add . && git commit -m "$(echo $@)" && git push
exit 0 
