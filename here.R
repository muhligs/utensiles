### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
here <- function(file=""){
	file <- paste0("/",file)
	if(file=="/")file <- ""
	paste0(dirname(rstudioapi::getActiveDocumentContext()$path),file)
	}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
