#!/usr/bin/gnuplot -p
datafile = 'alltrace'
stats datafile u 3
splot for[IDX=1:STATS_blocks] datafile index (IDX-1) u 3:5:7 w linesp title columnheader(1)
#splot for[IDX=1:STATS_blocks] datafile index (IDX-1) u 3:5:7 w linesp 
#splot for[IDX=1:*] datafile index (IDX-1) u 3:5:7 w linesp 

