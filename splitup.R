### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
splitup <- function(df,x,y,value){
	dimx <- length(unique(df[,x]))
	dimy <- length(unique(df[,y]))
	mat <- matrix(NA,nrow = dimx,ncol = dimy)
	rownames(mat) <- unique(df[,x])
	colnames(mat) <- unique(df[,y])
	for(i in seq_along(df[,x])){
		mat[df[i,x],df[i,y]] <- df[i,value]
		}
	return(mat)
}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
