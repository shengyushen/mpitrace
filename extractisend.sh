#!/bin/bash
awk '{total[$3][$4]=total[$3][$4]+$2} END{for(x in total) {for(y in total[x]) {print x " " y " " total[x][y]}}}' alltrace > sendp2p
gnuplot -p -e 'set view map;splot "sendp2p" u 1:2:3 with points palette pt 9'
