#! /bin/bash
for file in `ls *.svg`; do
  echo $file
  inkscape -D -z --file=$file --export-pdf=`echo $file | cut -f 1 -d '.'`.pdf
done
