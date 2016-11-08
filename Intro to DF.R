x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Basketball", "Soccer", "Tennis", "Lacrosse", "Baseball", "Rugby")
length(x)
length(y)
length(q)
theDF <- data.frame(x,y,q)
theDF

theDF <- data.frame(First = x, Second = y, Sport = q)
# Sport stored as factor
class(theDF$Sport)

theDF <- data.frame(First = x, Second = y, Sport = q, stringsAsFactors = FALSE)
class(theDF$Sport)

nrow(theDF)
ncol(theDF)
dim(theDF)

NROW(theDF)

# vectors don't have rows, they have a length
nrow(x)
length(x)

# works for both vectors & DF
NROW(x)

# col names
names(theDF)
names(theDF)[3]
rownames(theDF)
rownames(theDF) <- c("One", "Two", "Three", "Four", "Five",
                     "Six", "Seven", "Eight", "Nine", "Ten")
rownames(theDF)
theDF
rownames(theDF) <- NULL
rownames(theDF)

head(theDF)
head(theDF, n=7)
tail(theDF)
class(theDF)

# access ind col
theDF$Sport
theDF[3, 2]
theDF[3,2:3]
theDF[c(3,5),2]
theDF[c(3,5), 2:3]
# 3rd col, return a vector
theDF[,3]
# returns df
theDF[,2:3]
# don't convert to vector, return it as df
theDF[,3, drop=FALSE]
theDF[2,]

# vectors: every elem is of same type
# df: each col can be seperate type

# specify col by name in any order
theDF[, c("First", "Sport")]

theDF["Sport"]
theDF[["Sport"]]
