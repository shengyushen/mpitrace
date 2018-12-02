#!/usr/bin/awk -f
{
	src=substr(FILENAME,length(FILENAME)-11,4)+0
	if($0 ~ /MPI_Isend entering/) {
		type = $1
		start = substr($5,1,length($5)-1)
		duration = $7
		getline
		if($0~/int count=/) {
			count=substr($2,7,length($2)-6)
			getline
			if($0 ~ /MPI_Datatype/) {
				datatype = substr($3,2,length($3)-2)
				if(datatype=="MPI_DOUBLE") {
					count=count*4
				} else if(datatype=="MPI_UNSIGNED_CHAR"){
					count=count*1
				} else{
					print "Error : not recognized data type " datatype " at line " NR
					print $0
					exit 1
				}
				getline
				if($0 ~ /int dest=/ ) {
					dest=substr($2,6,length($2)-5)
					print type " " count " " src " " dest " " start " " duration
				} else {
					print "Error : No dest at line " NR
					print $0
					exit 1
				}
				
			} else {
				print "Error : No data type at line " NR
				print $0
				exit 1
			}
		} else {
			print "Error : no element count at line " NR
			print $0
			exit 1
		}
	}
}

