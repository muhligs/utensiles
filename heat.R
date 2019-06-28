### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
heat <- function(x,nam=TRUE,main=NULL){
	ydim <- dim(x)[1]
		xdim <- dim(x)[2]
		if(is.vector(x)){
			ydim <- 1
			xdim <- length(x)
		}
		if(is.null(main))main <- ""
	plot(type="n",1,1,xlim=c(0,xdim),ylim=c(0,ydim),xlab = "",ylab = "",axes = FALSE,main=main)
#segments(x0 = 0:ydim,x1 =0:ydim ,y0 =rep(0,xdim) ,y1 = rep(ydim,xdim),lwd=0.1)
#segments(x0 = rep(0,ydim),x1 =rep(xdim,ydim) ,y0 =0:ydim ,y1 = 0:ydim,lwd=0.1)	
	# make values into colors
	minx <- min(x)
	maxx <- max(x)
	 x <- (x-minx)/(maxx - minx)
	vec <- as.vector(t(as.matrix(x)))

	#
	vec[is.na(vec)] <- 1
color <- gray(1-vec)
	rect(xleft = rep(0:(xdim-1),ydim) ,xright = rep(1:(xdim),ydim),ybottom = rep(0:(ydim-1),each=xdim) ,ytop = rep(1:(ydim),each=xdim),col=color,border = FALSE)#sample(c(TRUE,FALSE),xdim*ydim,replace = TRUE))
	if(nam){
			mtext(text = colnames(x),side = 1,at = 1:xdim-0.5,las=2,cex=0.7)
			mtext(text = rownames(x),side = 2,at = 1:ydim-0.5,las=1,cex=max(min(floor(0.1*100/ydim),0.7),0.5))
		}
	}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
