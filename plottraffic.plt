#!/usr/bin/gnuplot -p

#set view 60,150,1,1
#set pm3d at b
#set hidden3d
#set xlabel "src";
#set ylabel "dest";
#set zlabel "traffic(B)";
#splot "p2ptraffic1" u 1:2:3 with lines

set multiplot layout 1,2

set title "Linear send pattern"
set view map
set autoscale fix
set size square
set xlabel "src";
set ylabel "dest";
set palette defined (0 'white', 0.25 'blue', 0.5 'green', 0.75 'yellow', 1 'red')
plot "map" matrix with image

set title "Logscale send pattern"
set view map
set autoscale fix
set size square
set xlabel "src";
set ylabel "dest";
set palette defined (0 'white', 0.25 'blue', 0.5 'green', 0.75 'yellow', 1 'red')
set logscale cb
plot "map" matrix with image
