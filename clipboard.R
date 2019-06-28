### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
write_clipboard = function(x, .rownames = F) {
    #decide how to write
    #windows is easy!
    if (Sys.info()['sysname'] %in% c("Windows")) {
      #just write as normal
      write.table(x, "clipboard", sep = "\t", na = "", row.names = F)
    } else {
      #for non-windows, try xclip approach
      #https://stackoverflow.com/a/10960498/3980197
      write.xclip = function(x) {
        #if xclip not installed
        if (!isTRUE(file.exists(Sys.which("xclip")[1L]))) {
          stop("Cannot find xclip")
        }
        con <- pipe("xclip -selection c", "w")
        on.exit(close(con))
        if(is.data.frame(x))write.table(x, con, sep = "\t", na = "", row.names = F) else {sink(file = con);cat(x);sink()}
      }

      tryCatch({
        write.xclip(x)
      }, error = function(e) {
        message("Could not write using xclip")
      })
    }
}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
read_clipboard = function(header = T,
                          sep = "\t",
                          na.strings = c("", "NA"),
                          check.names = T,
                          stringsAsFactors = F,
                          dec = ".",
                          ...) {
  #decide how to read
  #windows is easy!
  if (Sys.info()['sysname'] %in% c("Windows")) {
    #just read as normal
    read.table(file = con, sep = sep, header = header, check.names = check.names, na.strings = na.strings, stringsAsFactors = stringsAsFactors, dec = dec, ...)
  } else {
    #for non-windows, try xclip approach
    #https://stackoverflow.com/a/10960498/3980197
    read.xclip = function(x) {
      #if xclip not installed
      if (!isTRUE(file.exists(Sys.which("xclip")[1L]))) {
        stop("Cannot find xclip")
      }
      con <- pipe("xclip -o -selection c", "r")
      on.exit(close(con))
      read.table(file = con, sep = sep, header = header, check.names = check.names, na.strings = na.strings, stringsAsFactors = stringsAsFactors, dec = dec, ...)
    }

    tryCatch({
      read.xclip(x)
    }, error = function(e) {
      message(sprintf("error: %s", e$message))
    })
  }
}
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
