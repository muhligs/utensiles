# overlap(head(DT$chr,20),head(DT$start,20),head(DT$end,20),base=0,selectfile="/home/mmn/BACKUP/projects2/pcawg/elementAnnotation/melanomaChrom/wgEncodeAwgDnaseDukeMelanoUniPk.narrowPeak")
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# this function takes a df (inRecords) with 1-based coordinates, writes a bed-like file for the specified cols and overlaps with a bedfile
# The output is 'mergeOutput, i.e. selectRecords followed by inRecords.
overlap <- function(df,cols,what){
#	if(!length(cols) %in% 4:12)stop("cols should be vector of numbers length 4 to 12")
	cat("writing bed ...")
	system("rm /home/mmn/temp/temp.bed",ignore.stderr = TRUE)
write.table(sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE,x=df[,cols],file="/home/mmn/temp/temp.bed")
cat("overlapping ...")
	system(paste0("overlapSelect -inCoordCols=",cols[1]-1," -mergeOutput ",what," /home/mmn/temp/temp.bed /home/mmn/temp/temp.tab"))
		cat("reading ...")
	res <- read.table(as.is=TRUE, "/home/mmn/temp/temp.tab", sep="\t")
	system("rm /home/mmn/temp/temp.tab",ignore.stderr = TRUE)
cat("finished ...\n")	
return(res)
}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###