#!/bin/bash
rm -f reduce
touch reduce
for fn in ./*.txt; do
  extractreduce.awk  $fn >>reduce
done
cat reduce |sort -n -k3 > reduce1
