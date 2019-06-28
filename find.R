### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
find <- function(x,loc = "/home/mmn/Dropbox/programming/R"){
	if(grepl(" ",x)&!grepl("^'",x))x <- sub("$","'",sub("^","'",x))
  var <- paste0("grep -r --include=*.R --include=*.Rmd --include=*.txt -A 1 -B 1 ",x," ",loc," &")
  cat(var,"\n")
  system(var)
  }

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
