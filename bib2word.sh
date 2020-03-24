#!/bin/bash

if [ -z "$1" ]; then 
    echo "usage: bib2word <file.bib> [other.bib]"
else 
    for file in "$@"
    do
        bib2xml "$file" | xml2wordbib | sed 's|<b:Tag>article</b:Tag>|<b:Tag>'$file'</b:Tag>|g' > "$(basename "$file" .bib).xml"
    done
fi