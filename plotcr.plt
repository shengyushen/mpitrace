#!/usr/bin/gnuplot -p
set xlabel "rank number"
set ylabel "average sending bandwidth"
set logscale x;
set logscale y;
plot "cr.bandwidth" with linesp
