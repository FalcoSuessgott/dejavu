#!/usr/bin/env bash

[ $# -eq 0 ] && echo "no commit message provided." &&  exit 1
echo "building main ToC"
gh-md-toc */*.md > README.md 
sed '/^[[:space:]]*$/d' README.md
sed -i '1s/^/# Wiki\n## ToC\n/' README.md

for dir in */;do 
    file=$dir${dir::-1}.md
    [[ -f $file ]] && gh-md-toc --insert "$file" 1>/dev/null && echo "build ToC for $file"
    rm "$file".* 2>/dev/null 
done
git add . && git commit -m "$(echo $@)" && git push
exit 0 
