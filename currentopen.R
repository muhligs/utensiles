# current open, a function to display a list of currently open files in Rstudio
# outputs a data frame with the paths of currently open files, their last modification epoch time
# and time since last modification in seconds. 
# Output is sorted by last modification epoch time (most recent first)
currentopen <- function(){
  path_to_rstudio_sources <- "~/.local/share/rstudio/sources"
  ld <- list.dirs(path_to_rstudio_sources, full.names = T, recursive = F)
  ld <- ld[grepl("/s-",ld)] # this identifies the current rstudio session folder (s-xxxxxxx)
  lf <- list.files(ld, full.names = T, recursive = T, no.. = T)
  lf <- lf[!grepl("-contents$",lf)&!grepl("lock_file$",lf)] # remove content and lock files
  var <- c()
  for(i in lf) var <- c(var, suppressWarnings(readLines(i))) # read the meta files
  path <- var[grepl("\"path\":",var)] # extract paths from the meta files
  path <- sub("^ *","",gsub("\"","",sub(",$","",sub("\"path\": ","",path)))) # tidy up
  lcu <- var[grepl("last_content_update\":",var)] # extract last modification time point
  lcu <- sub("^ *","",gsub("\"","",sub(",$","",sub("\"last_content_update\": ","",lcu))))
  lcu <- substr(lcu,1,10) # remove milliseconds in some numbers
  out <- data.frame(path=path, lastUpdate=as.numeric(lcu))
  out <- out[out$path!="null",]
  out$secSinceUpdate <- round(unclass(Sys.time())-out$lastUpdate,0)
  out[order(-out$lastUpdate),]
}

# usage:
# currentopen()
# currentopen()$path
