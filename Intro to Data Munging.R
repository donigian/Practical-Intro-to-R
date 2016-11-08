theMatrix <- matrix(1:9, nrow=3)
theMatrix

# sum each col, apply expects a matrix
# if u supply a df, it will turn to matrix
apply(theMatrix, MARGIN = 2, sum)
apply(theMatrix, MARGIN = 1, sum)

colSums(theMatrix)
rowSums(theMatrix)

theMatrix[2,1] <- NA
theMatrix
apply(theMatrix,1,sum)
apply(theMatrix,1,sum, na.rm=TRUE)
rowSums(theMatrix, na.rm=TRUE)

# lapply iterates over a list
theList <- list(A=matrix(1:9, nrow=3), B=1:5, C=matrix(1:4,2), D=2)
theList
lapply(theList, sum)

# tries to return a vector, else returns a list
sapply(theList,sum)
theNames <- c("armen", "artin", "agas")
lapply(theNames, nchar)
sapply(theNames, nchar)

# mapply traverses 2 lists at same time
firstList <- list(A=matrix(1:16,4), B=matrix(1:16,2), C=1:5)
secondList <- list(A=matrix(1:16,4), B=matrix(1:16,8), C=15:1)
firstList
secondList

mapply(identical, firstList, secondList)

simplefunc <- function(x,y)
{
  NROW(x) + NROW(y)
}

mapply(simplefunc, firstList, secondList)

# apply a func to subset of data is a common task...aggregate func
require(ggplot2)
data(diamonds)
head(diamonds)
mean(diamonds$price)
aggregate(price ~ cut, diamonds, mean)
aggregate(price ~ cut, diamonds, mean, na.rm = TRUE)
aggregate(price ~ cut + color, diamonds, mean)

aggregate(price ~ cut + color, diamonds, mean)
aggregate( cbind(price, carat) ~ cut, diamonds, mean)
aggregate( cbind(price, carat) ~ cut + color, diamonds, mean)

require('plyr')
head(baseball)
baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))

baseball$hbp[is.na(baseball$hbp)] <- 0
any(is.na(baseball$hbp))
baseball <- baseball[baseball$ab>=50, ]
# with saves you some typing
baseball$OBP <- with(baseball, (h+bb+hbp) / (ab + bb + hbp + sf))
baseball$OBP
tail(baseball)

obp <- function(data)
{
  # = assigns column name to df
  c(OBP = with(data, sum(h+bb+hbp) / sum(ab+ bb+hbp+sf)))
}
# split + apply + combine
careerOBP <- ddply(baseball, .variables = "id", obp)
head(careerOBP)
careerOBP <- careerOBP[order(careerOBP$OBP, decreasing = TRUE),]
head(careerOBP)

theList <- list(A=matrix(1:9,3), B=1:5, C=matrix(1:4,2), D=2)
theList
lapply(theList, sum)
llply(theList,sum)
identical(lapply(theList, sum), llply(theList,sum))
# slightly diff effects between plyr and base r equivalents (sapply, lapply, etc...)
sapply(theList,sum)
laply(theList, sum)

head(diamonds)
aggregate(price ~ cut, diamonds, each(mean, median))

numcolwise(sum, na.rm=TRUE)(diamonds)
sapply(diamonds[,sapply(diamonds, is.numeric)], sum)

sport <- c("hockey", "baseball", "football")
league <- c("NHL", "MLB", "NFL")
trophy <- c("Stanely Cup", "Comissioner's Trophy", "Vince Lombardi Trophy")
sports1 <- cbind(sport, league, trophy)
sports1
sports2 <- data.frame(sport = c("Basketball", "Golf"), 
                      league=c("NBA", "PGA"),
                      trophy= c("Larry", "Wanamaker"))
sports2
sports <- rbind(sports1, sports2)
sports
# rbind & cbind, is when u want to take vectors, matricies or df and combine
# them respectively

# view in Rstudio formats data welll
countryMerged <- merge(x=codes, y=countries, by.x="Country.name", by.y="Country")
# beware above can be slow for large datasets, use join in plyr instead
require(plyr)
# since plyr needs the names to be exactly the same, we must rename
codes <-rename(codes, c(Country.name="Country"))
countryJoined <- join(x=codes, y=countires, by="Country")

require(reshape2)
head(airquality)
# wide to long format
airMelt <- melt(airquality, id=c("Month", "Day"), 
                value.name= "value", 
                variable.name = "metric")
head(airMelt)
dim(airMelt)
dim(airquality)

# turn into wide format
airCast <- dcast(airMelt, Month + Day ~ metric, value.var ="value")
head(airCast)
airCast <- airCast[, c("Ozone", "Solar.R", "Wind", "Temp", "Month", "Day")]
head(airCast)

library(tidyr)
library(magrittr)
head(airquality)
airGather <- airquality %>% gather(Metric, Value, -c(Month,Day))
tail(airGather)
airSpread <- airGather %>% spread(Metric,Value)
head(airSpread)

data("diamonds", package = "ggplot2")
head(diamonds)
# aggregate func built in R
aggregate(diamonds$price, by=list(diamonds$cut), mean)
# formula interface to aggregate, but it's slow
aggregate(price ~ cut, diamonds, mean)

# much faster, returns a vector
tapply(diamonds$price, INDEX=diamonds$cut, mean)

require(plyr)
#ddply: df to df  
#llply: list to list
#dlply: df to list
#adply:array to df

head(diamonds)
# much faster than aggregate
ddply(diamonds, "cut", summarize, Price=mean(price))
daply(diamonds, "cut", summarize, Price=mean(price))

require(doParallel)
cl <-makeCluster(4)
registerDoParallel(cl)
ddply(diamonds, "cut", function(x) mean(x$price), .parallel = TRUE)
head(diamonds)

require(data.table)
diaDT <- data.table(diamonds)
diaDT
fread
# data.table is one of the fastest way to do data munging in R
diaDT[, mean(price), by=cut]

require(plyr)
require(dplyr)
require(magrittr)

# pipes in R
dim(diamonds)
diamonds %>% head
diamonds %>% dim
# nested func calls run faster than pipes, thought readibility would suggest
# otherwise

diamonds %>% group_by(cut) %>% dplyr::summarize(Price=mean(price))
