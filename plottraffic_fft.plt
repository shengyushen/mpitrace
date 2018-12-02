#!/usr/bin/gnuplot -p
set xlabel "time(seconds)"
set ylabel "rank"
plot "alltrace" u 4:(stringcolumn(1) eq "MPI_Group_incl"?$3:1/0),\
             "" u 4:(stringcolumn(1) eq "MPI_Alltoallv"?$3:1/0)
