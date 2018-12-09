#!/usr/bin/awk -f
#include <assert.h>

function assert(condition) {
	if(! condition) {
		print "Error : " condition
		exit 1
	}
}

{
	cnt=0
}

{
	if($0 ~ /^int rank=/) {
		rank=substr($2,6,length($2)-5)
#		print rank
	}

	if($0 ~ /^MPI_Group_incl entering /) {
		time = substr($5,1,length($5)-1)
		getline
		assert($0 ~ /MPI_Group group=/)
		group=substr($2,7,length($2)-6)
#		print group
		getline
		assert($0 ~ /int count=/)
		getline
		assert($0 ~ /int ranks/)
		n=split($0,arr,"=")
		assert(n==2)
		x=substr(arr[2],2,length(arr[2])-2)
		split(x,arank,"[ ]\*,[ ]\*")
		print "\"xx\""
		for(x in arank) {
			print "MPI_Group_incl rankstart " rank " time " time " rank "  arank[x]
		}
		print ""
#	} else if($0 ~ /MPI_Alltoallv entering/) {
#		print "MPI_Alltoallv " substr($5,1,length($5)-1)
	}
}

