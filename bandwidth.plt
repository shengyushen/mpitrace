#!/usr/bin/gnuplot -p -e 
# lat in sed
# bw in bps
# sz in BYTE
f(lat,bw,sz)=sz*8/(sz*8/bw+lat)/(10**9)
fnvd(x)=f(280*(10**(-9)),200*(10**9),x) 
fnvs(x)=f(420*(10**(-9)),1200*(10**9),x)
fetd(x)=f(800*(10**(-9)),200*(10**9),x) 
fets(x)=f(3200*(10**(-9)),1200*(10**9),x)
set key left top
set xlabel "Packet size(Byte)"
set ylabel "Effective Bandwidth(Gbps)"
set logscale x
x1 = 100000
x2 = 1000000
plot [1:10**7]\
    fnvd(x) title "NVLINK direct 200Gbps + 280ns" ,\
    fnvs(x) title "NVSWITCH 1200Gbps + 420ns" ,\
    fetd(x) title "ETHERNET direct : 200Gbps + 800ns" ,\
    fets(x) title "ETHERNET SWITCH : 1200Gbps + 3200ns" ,\
    '+' using ($0 == 0 ? x1 : NaN):(fnvs(x1)):(sprintf('%f', fnvs(x1))) with labels offset char 1,-0.2 left textcolor rgb 'blue' point linestyle 1 notitle,\
    '+' using ($0 == 0 ? x1 : NaN):(fets(x1)):(sprintf('%f', fets(x1))) with labels offset char 1,-0.2 left textcolor rgb 'blue' point linestyle 1 notitle,\
    '+' using ($0 == 0 ? x2 : NaN):(fnvs(x2)):(sprintf('%f', fnvs(x2))) with labels offset char 1,-0.2 left textcolor rgb 'blue' point linestyle 1 notitle,\
    '+' using ($0 == 0 ? x2 : NaN):(fets(x2)):(sprintf('%f', fets(x2))) with labels offset char 1,-0.2 left textcolor rgb 'blue' point linestyle 1 notitle
                 

