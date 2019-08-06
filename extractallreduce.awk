#!/usr/bin/awk -f
/^MPI_Allreduce entering/ {
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
	op=substr($2,4,length($2)-3) ; 
	getline ; 
	comm=substr($2,6,length($2)-5);
	print rank " MPI_Allreduce " time " " duration " " count " " datatype " " op " " comm;
}

/^MPI_Comm_create entering/ {
	split(FILENAME,ar,"-");
  split(ar[3],arr,".")
	rank=substr(arr[1],1,4);
	time=substr($5,1,length($5)-1);
	duration=$7;
	getline ; 
	getline ; 
	getline ; 
	comm=substr($2,9,length($2)-8);
	print rank " MPI_Comm_create " time " " duration " " comm;
}

/^MPI_Comm_split entering/ {
	split(FILENAME,ar,"-");
  split(ar[3],arr,".")
	rank=substr(arr[1],1,4);
	time=substr($5,1,length($5)-1);
	duration=$7;
	getline ; 
	getline ; 
	getline ; 
	getline ; 
	comm=substr($2,9,length($2)-8);
	print rank " MPI_Comm_split " time " " duration " " comm;
}
