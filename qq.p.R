###################################################################################################
qq.p <- function(pvals,label=FALSE,name.vec=NULL,main="",lab.size=0.2,maxy=FALSE,maxx=FALSE,col=1,point.cex=0.7, add=FALSE){
	if(!is.null(name.vec))names(pvals) <- name.vec
observed <- sort(pvals)
if(length(col)>1){col <- col[order(pvals)]}
lobs <- -(log10(observed))
expected <- seq_along(observed) 
lexp <- -(log10(expected / (length(expected)+1)))
if(!maxy) maxy <- ceiling(max(lobs[is.finite(lobs)]))+0.5
if(!maxx) maxx <- ceiling(max(lexp))+0.5
#if(!is.finite(maxx)) maxx <- 1
#if(!is.finite(maxy)) maxy <- 1
if(!add)plot(c(0,max(maxx,maxy)), c(0,max(maxx,maxy)), col="red", lwd=3, type="l", xlab="Expected p", ylab="Observed p", xlim=c(0,maxx), ylim=c(0,maxy), las=1, xaxs="i", yaxs="i", bty="l",main=main,axes = FALSE)
at.y.lab <- -seq(0,floor(maxy))
if(length(at.y.lab)>7) at.y.lab <-	-seq(from = 0,to = floor(maxy), by=floor(floor(maxy)/5))
labelsX=parse(text=paste(10, "^",as.character(0:-floor(maxx)), sep=""))
labelsY=parse(text=paste(10, "^",as.character(at.y.lab), sep=""))
axis(side=1,labels = FALSE,lwd.ticks = 0)
axis(side=2,labels = FALSE,lwd.ticks = 0)
axis(side=1,at = 0:floor(maxx),labels = labelsX)
axis(side=2,at = -at.y.lab,labels = labelsY,las=2)

points(lexp, lobs, pch=18, cex=point.cex, col=col) 
  if(label){
ylab <- -log10(observed[observed<label])
xlab <- lexp[observed<label]
    labels <- names(observed)[observed<label]
    if(length(labels)>0)text(xlab,ylab,labels,cex=lab.size,pos=2,col=col)
  }
}


###################################################################################################


qq.p2 <- function(pvals,label=FALSE,name.vec=NULL,main="",lab.size=0.2,maxy=FALSE,maxx=FALSE,col=1,point.cex=0.7, add=FALSE, pos=2, pch=18,bg=1, linecol=2){
	if(!is.null(name.vec))names(pvals) <- name.vec
observed <- sort(pvals)
if(length(col)>1){col <- col[order(pvals)]}
if(length(pch)>1){pch <- pch[order(pvals)]}
if(length(pos)>1){pos <- pos[order(pvals)]}
if(length(bg)>1){bg <- bg[order(pvals)]}
if(length(point.cex)>1){point.cex <- point.cex[order(pvals)]}
lobs <- -(log10(observed))
expected <- seq_along(observed) 
lexp <- -(log10(expected / (length(expected)+1)))
if(!maxy) maxy <- ceiling(max(lobs[is.finite(lobs)]))+0.5
if(!maxx) maxx <- ceiling(max(lexp))+0.5
#if(!is.finite(maxx)) maxx <- 1
#if(!is.finite(maxy)) maxy <- 1
if(!add)plot(c(0,max(maxx,maxy)), c(0,max(maxx,maxy)), col=linecol, lwd=3, type="l", xlab="Expected p-value", ylab="Observed p-value", 
	xlim=c(0,maxx), ylim=c(0,maxy), las=1, xaxs="i", yaxs="i", bty="l",main=main,axes = FALSE)
at.y.lab <- -seq(0,floor(maxy))
if(length(at.y.lab)>7) at.y.lab <-	-seq(from = 0,to = floor(maxy), by=floor(floor(maxy)/5))
labelsX=parse(text=paste(10, "^",as.character(0:-floor(maxx)), sep=""))
labelsY=parse(text=paste(10, "^",as.character(at.y.lab), sep=""))
axis(side=1,labels = FALSE,lwd.ticks = 0)
axis(side=2,labels = FALSE,lwd.ticks = 0)
axis(side=1,at = 0:floor(maxx),labels = labelsX)
axis(side=2,at = -at.y.lab,labels = labelsY,las=2)

points(lexp, lobs, pch=pch, cex=point.cex, col=col,bg=bg) 
  if(label){
ylab <- -log10(observed[observed<label])
xlab <- lexp[observed<label]
    labels <- names(observed)[observed<label]
    if(length(labels)>0)text(xlab,ylab,labels,cex=lab.size,pos=pos,col=col)
  }
names(lexp) <- names(observed)
names(lobs) <- names(observed)
return(list(expected=lexp,observed=lobs))
}
