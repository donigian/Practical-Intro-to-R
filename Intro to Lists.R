list1 <- list(1,2,3)
list1
list2 <- list(c(1,2,3))
list2
list3 <- list(c(1,2,3), 3:7)
list3
theDF <- data.frame(First=1:5, Second=5:1, 
                    Sport=c("Hockey", "Football", "Baseball", "Curling", "Basketball"),
                    stringsAsFactors = FALSE)
theDF
list4 <- list(theDF, 1:10)
list4
list5 <- list(theDF, 1:10, list3)
list5
names(list5)
names(list5) <- c("df","vector","list")
names(list5)
list5

list6 <- list(TheDataFrame=theDF, TheVectpr=1:10, TheList=list3)
names(list6)
list6

# list are type of vectors, more efficient to create and populate a list rather than 
# create size 1 then add
emptyList <- vector(mode="list", length = 4)
emptyList
emptyList[[1]] <- 5
emptyList
emptyList[1]<- 5

list5[[1]]
list5[["df"]]
list5[[1]]$Sport
list5[[1]][,"Second"]

length(list5)
NROW(list5)
list5[[4]] <- 2
list5
list5[["NewElement"]] <- 3:6
list5
names(list5)
