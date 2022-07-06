### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# adding environment
utensiles <- new.env(parent = globalenv())
source("./here.R",local = utensiles)
source("./colsplit.R",local = utensiles)
source("./splitup.R",local = utensiles)
source("./heat.R",local = utensiles)
source("./overlap.R",local = utensiles)
source("./is.unique.R",local = utensiles)
source("./find.R",local = utensiles)
source("./clipboard.R",local = utensiles)
source("./gif.R",local = utensiles)
source("./qq.p.R",local = utensiles)
source("./currentopen.R",local = utensiles)
attach(utensiles)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
