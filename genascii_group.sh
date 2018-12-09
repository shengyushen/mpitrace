#!/usr/bin/bash
rm -f alltrace 
touch alltrace
for fn in ./*.bin; do
  dumpi2ascii $fn > ${fn}.txt
	../a2atraffic.awk ${fn}.txt >  ${fn}.traffic
	rm -f ${fn}.txt
	cat ${fn}.traffic >> alltrace
#	rm -f ${fn}.traffic 
done

