#!/usr/bin/bash
# with minimal 44 byte overhead
# LRH 8
# BTH 12
# RETH 16
# data include below
# ICRC 4
# VCRC 2
# 2byte framing
awk 'BEGIN{	min=0;	max=0;} {	arr[$3]=arr[$3]+$2+44;if(min==0) {	min=$5;	}	max=$5;} END {	for(x in arr) {		print x " send " 8*arr[x]/((max-min)*1024*1024) "Mbps total data " arr[x] " total time " max-min	} }' alltrace
