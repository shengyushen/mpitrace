#!/usr/bin/gnuplot -p -e 
# lat in sed
# bw in bps
# sz in BYTE
f(lat,bw,sz)=sz*8/(sz*8/bw+lat)/(10**9)
fnvd(x)=f(280*(10**(-9)),200*(10**9),x) 
fnvs(x)=f(420*(10**(-9)),1200*(10**9),x)
fetd(x)=f(800*(10**(-9)),200*(10**9),x) 
fets(x)=f(3200*(10**(-9)),1200*(10**9),x)
set xlabel "Packet size(Byte)"
set ylabel "Effective Bandwidth(Gbps)"
set logscale x
plot [1:10**7]\
    fnvd(x)/fnvd(x) title "NVLINK direct 200Gbps + 280ns" ,\
    fnvs(x)/fnvd(x) title "NVSWITCH 1200Gbps + 420ns" ,\
    fetd(x)/fnvd(x) title "ETHERNET direct : 200Gbps + 800ns" ,\
    fets(x)/fnvd(x) title "ETHERNET SWITCH : 1200Gbps + 3200ns" 
                 

