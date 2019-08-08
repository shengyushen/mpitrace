#!/usr/bin/awk -f
/^MPI_Send entering/ {
	split(FILENAME,ar,"-");
  split(ar[3],arr,".")
	rank=substr(arr[1],1,4);
	time=substr($5,1,length($5)-1);
	duration=$7;
	getline ; 
	count=substr($2,7,length($2)-6) ; 
	getline ; 
	datatype=substr($2,10,length($2)-9) ;
	getline ; 
	dest=substr($2,6,length($2)-5) ; 
	getline ; 
	tag=substr($2,5,length($2)-4);
	getline ; 
	comm=substr($2,6,length($2)-5);
	print rank " MPI_Allreduce " time " " duration " " count " " datatype " " dest " " tag " " comm;
}

