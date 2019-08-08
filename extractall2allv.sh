#!/bin/bash
rm -f all2allv
touch all2allv
for fn in ./*.txt; do
  extractall2allv.awk  $fn >>all2allv
done
cat all2allv |sort -n -k3 > all2allv1
grep MPI_Alltoallv all2allv1 > all2allv2
awk '{if($5!=last5 || $6!=last6 || $7!=last7 || $8!=last8 || $3-last3>1) {print ""};print;last3=$3;last5 =$5;last6=$6;last7=$7;last8=$8;}' all2allv2 > all2allv3
grep " 2$" all2allv2 > all2allv2only
awk '{if(first==0) {first=$3}; last=$3;} END{print last-first}' all2allv2only > timediff
