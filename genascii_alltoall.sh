#!/usr/bin/bash
rm -f alltrace
touch alltrace
for fn in ./*.bin; do
  dumpi2ascii $fn > ${fn}.txt
	awk 'BEGIN{rank=-1} {if(rank==-1 && $1=="int" && $2 ~ /rank=/) {rank=substr($2,6,length($2)-5)};if($1=="MPI_Alltoallv") {if(rank==-1) {print "Error at line " NR; exit(1)};print $1 " rank  " rank " " substr($5,0,length($5)-1) " " $7} else if($1=="MPI_Group_incl") {if(rank==-1) {print "Error at line " NR; exit(1)};print $1 " rank " rank " " substr($5,0,length($5)-1) " " $7}}' ${fn}.txt > ${fn}.traffic
	rm -f ${fn}.txt
	cat ${fn}.traffic >> alltrace
	rm -f ${fn}.traffic 
done

