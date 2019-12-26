#!/usr/bin/gnuplot -p -e  -c
#bin(x,s)=s*int(x/s);plot ARG0 u (bin($1,ARG2)):2 smooth freq w boxes
bin(x,s)=s*int(x/s);plot ARG0 u 1:2
