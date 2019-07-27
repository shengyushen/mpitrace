#!/bin/bash
rm -f alltrace
touch alltrace
for fn in ./*.bin; do
  dumpi2ascii $fn > ${fn}.txt
	../sendtraffic.awk ${fn}.txt > ${fn}.traffic
	rm -f ${fn}.txt
	cat ${fn}.traffic >> alltrace
	rm -f ${fn}.traffic 
done
awk '{arr[$3][$4]=arr[$3][$4]+$2} END{for (id1 in arr) for (id2 in arr[id1]) {print id1 " " id2 " " arr[id1][id2]}}' alltrace|sort -n -k 1 -k 2 > p2ptraffic

awk 'function max(a, b) { return a > b ? a: b } BEGIN{large=0;} {arr[$1][$2]=$3;large=max(large,$1);large=max(large,$2);} END{for(i=0;i<=large;i=i+1) { for(j=0;j<=large;j=j+1){if(arr[i][j]=="") {printf "0 "} else {printf arr[i][j] " "} };print ""}}' p2ptraffic > map

awk 'BEGIN{last=-1;cnt=0} {if(NF==0) {print last " " cnt} else if(last==$1) {cnt=cnt+1} else if($1>0) {print last " " cnt;cnt=0;} ;last=$1} END{print last " " cnt}' p2ptraffic > rank2rank

cat p2ptraffic |awk 'BEGIN{print "0 0 0"} {print;if($1-1==$2) {print $1 " " $1 " 0"}  }'|awk '{if($1==last1) {if(last2+1<$2) {for(i=last2+1;i<$2;i=i+1) {print $1 " " i " 0"}}} print;last1=$1;last2=$2}'|awk '{if($1!=last) {print""};print;last=$1}' > p2ptraffic1

