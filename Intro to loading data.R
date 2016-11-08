# https://raw.githubusercontent.com/JWarmenhoven/ISLR-python/master/Notebooks/Data/Boston.csv
bostonDF <- read.table(file="https://raw.githubusercontent.com/JWarmenhoven/ISLR-python/master/Notebooks/Data/Boston.csv",
                     header=TRUE, sep=",")
head(bostonDF)
class(bostonDF)
class(bostonDF$crim)
# speed up data read into R by setting stringsAsFActors=FALSE to prevent conversion of 
# character vectors to factors

# read_excel() deals with old/new formats of Excel
# use openxlsx for writing files
#download.file("https://raw.githubusercontent.com/JWarmenhoven/ISLR-python/master/Notebooks/Data/Boston.xlsx",
#              destfile = "Boston.xlsx",
#              mode="wb")
#read_excel("Boston.xlsx", sheet=1)

# to load data from RDBMs such as PostgreSQL see https://github.com/rstats-db/RPostgres

# to read from other stats tools, use foreign package
# read.spss, read.dta, read.ssd, read.octave, read.mtp, read.systat

bostonDF
save(bostonDF,file = "/Users/arm/code/R/data/Boston.rdata")

n <- 20
r <- 1:10
w <- data.frame(n,r)
w
multiple_obj_file <- "/Users/arm/code/R/data/multiple.rdata"
save(n,r,w,file = multiple_obj_file)
load(multiple_obj_file)

# web scraping
require(XML)
theURL <- "http://www.w3schools.com/html/html_tables.asp"
tableOutput <- readHTMLTable(theURL, which=1, header=FALSE, stringsAsFactors=FALSE)
head(tableOutput)
