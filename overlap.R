### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# this function takes a df (inRecords) with 1-based coordinates, writes a bed-like file for the specified cols and overlaps with a bedfile
# The output is 'mergeOutput, i.e. selectRecords followed by inRecords.
overlap <- function(df,cols,what){
#	if(!length(cols) %in% 4:12)stop("cols should be vector of numbers length 4 to 12")
	cat("writing bed ...")
	system("rm ~/temp/temp.bed",ignore.stderr = TRUE)
write.table(sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE,x=df[,cols],file="~/temp/temp.bed")
cat("overlapping ...")
	system(paste0("overlapSelect -inCoordCols=",cols[1]-1," -mergeOutput ",what," ~/temp/temp.bed ~/temp/temp.tab"))
		cat("reading ...")
	res <- read.table(as.is=TRUE, "~/temp/temp.tab", sep="\t")
	system("rm ~/temp/temp.tab",ignore.stderr = TRUE)
cat("finished ...\n")	
return(res)
}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
