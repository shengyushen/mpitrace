#!/usr/bin/gnuplot -p
#set title "traffic along time axis"
#set xlabel "time"
#set ylabel "packet size"
#set logscale y
#plot "alltrace" u 5:($3==0  ?$2:1/0),\
#			       "" u 5:($3==50 ?$2:1/0),\
#			       "" u 5:($3==100?$2:1/0),\
#			       "" u 5:($3==150?$2:1/0),\
#			       "" u 5:($3==200?$2:1/0)


set multiplot layout 4,1
plot "alltrace" u 5:2
set xrange [GPVAL_X_MIN:GPVAL_X_MAX]
plot "alltrace" u 5:($3==0  ?$2:1/0),\
             "" u 5:($3==6  ?$2:1/0),\
             "" u 5:($3==12 ?$2:1/0),\
             "" u 5:($3==18 ?$2:1/0)
plot "alltrace" u 5:($3==25 ?$2:1/0),\
             "" u 5:($3==31 ?$2:1/0),\
             "" u 5:($3==37 ?$2:1/0),\
             "" u 5:($3==43 ?$2:1/0)
plot "alltrace" u 5:($3==50 ?$2:1/0),\
             "" u 5:($3==56 ?$2:1/0),\
             "" u 5:($3==62 ?$2:1/0),\
             "" u 5:($3==69 ?$2:1/0)
plot "alltrace" u 5:($3==75 ?$2:1/0),\
             "" u 5:($3==81 ?$2:1/0),\
             "" u 5:($3==87 ?$2:1/0),\
             "" u 5:($3==93 ?$2:1/0)
