
gif <- function(file=NULL,delay=30){
if(is.null(file)) {cat("gif() starts listening for plots to add to a gif file.
gif() takes the parameters file and delay and produces a temporary environment.
Delay sets the time each plot is visible in the gif.\n
Now use png.gif() in front of your plot command and close with dev.off() for each plotyou wish to add to the gif.
When last plot of the gif is made, run gif.off().
This will produce the gif file in the current working directory (",getwd(),"/file.gif).
If you want to see the file immidiately, run giff.off(TRUE)...\n",sep="")
stop("gif file name gif(file='file') missing.")  
  }
  # making variables and environments
  op <- options(digits.secs = 6)
  owd <- getwd()
  nwd <- dirname(file)
  if(nwd==".")nwd <- owd
  setwd(nwd)
  suffix <- sub(" ","_",paste0(Sys.time(),"_",sample(10000:99999 ,1)))
  env <- paste0("gif.environment_",suffix)
  assign(paste0("gif.environment_",suffix),new.env(parent = globalenv()),pos=globalenv())
  assign("suffix",suffix,envir = get(paste0("gif.environment_",suffix)))
  assign("delay",delay,envir = get(paste0("gif.environment_",suffix)))
  assign("nwd",nwd,envir = get(paste0("gif.environment_",suffix)))
  file <- sub("[.]gif$","",file)
  assign("file",file,envir = get(paste0("gif.environment_",suffix)))
  tempdir <- paste0("temp.gif.dir_",suffix)
  system(paste0("mkdir ",tempdir))
  #assign("oplot",plot,envir = get(paste0("gif.environment_",suffix)))
png.gif <- function (...,temp=tempdir) {
  op <- options(digits.secs = 6)
  png(paste0(nwd,"/",temp,"/png",Sys.time(),"giftarget.png"))
#  plot(...)
#  dev.off()
#  plot(...)
}
assign("png.gif",png.gif,envir = get(paste0("gif.environment_",suffix)))
#e <<-get(paste0("gif.environment_",suffix))
attach(get(env),name = "gif.environment")
#  assign("plot.gif",plot.gif,pos=globalenv())
  options(op)
  setwd(owd)
}


gif.off <- function(show=FALSE){
env <- ls(pattern = "gif.environment",pos = globalenv())[1]
if(is.na(env))stop("no gif.environment found. Run gif() to create a new gif environment.")
suffix <- get(env)[["suffix"]]
file <- get(env)[["file"]]
delay <- get(env)[["delay"]]
nwd <- get(env)[["nwd"]]
print(nwd)
tempdir <- paste0("temp.gif.dir_",suffix)
owd <- getwd()
print(owd)
setwd(paste0(nwd,"/",tempdir))
print(getwd())
lf <- list.files(pattern=".png")
if(length(lf)!=0){
system(paste0("convert -delay ",delay," *.png -loop 0 ../",file,".gif"))
system("rm *giftarget.png")
}
setwd(nwd)
system(paste0("rmdir ",tempdir))
if(show)system(paste0("eog ",file,".gif &"))
setwd(owd)
if("gif.environment" %in% search())detach("gif.environment")
rm(list=env,pos = globalenv())
}
