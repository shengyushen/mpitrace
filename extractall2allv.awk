#!/usr/bin/awk -f
/^MPI_Alltoallv entering/ {
	split(FILENAME,ar,"-");
	rank=substr(ar[3],3,2);
	time=substr($5,1,length($5)-1);
	duration=$7;
  getline;
  getline;
  getline;
  getline;
  getline;
  getline;
  getline;
  getline;
#	getline ; 
#	count=substr($2,7,length($2)-6) ; 
#	getline ; 
#	datatype=substr($2,10,length($2)-9) ;
#	getline ; 
#	op=substr($2,4,length($2)-3) ; 
#	getline ; 
#	comm=substr($2,6,length($2)-5);
#	print rank " MPI_Allreduce " time " " duration " " count " " datatype " " op " " comm;
	comm=substr($2,6,length($2)-5);
	print rank " MPI_Alltoallv " time " " comm;
}

