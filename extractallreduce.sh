#!/bin/bash
rm -f allreduce
touch allreduce
for fn in ./*.txt; do
  extractallreduce.awk  $fn >>allreduce
done
cat allreduce |sort -n -k3 > allreduce1
grep MPI_Allreduce allreduce1 > allreduce2
awk '{if($5!=last5 || $6!=last6 || $7!=last7 || $8!=last8 || $3-last3>1) {print ""};print;last3=$3;last5 =$5;last6=$6;last7=$7;last8=$8;}' allreduce2 > allreduce3
grep " 2$" allreduce2 > allreduce2only
awk '{if(first==0) {first=$3}; last=$3;} END{print last-first}' allreduce2only > timediff
