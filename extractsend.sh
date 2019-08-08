#!/bin/bash
rm -f allreduce
touch allreduce
for fn in ./*.txt; do
  extractsend.awk  $fn >>send
done
awk '{total[$1][$7]=total[$1][$7]+$5} END{for(x in total) {for(y in total[x]) {print x " " y " " total[x][y]}}}' send > sendp2p
gnuplot -p -e 'set view map;splot "sendp2p" u 1:2:3 with points palette pt 9'
