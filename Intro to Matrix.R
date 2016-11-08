# matrix is similar to df, except all elements of matrix has to be same type
A <- matrix(1:10, nrow=5)
A
B <- matrix(21:30, nrow = 5)
C <- matrix(21:40, nrow = 2)
B
C
NROW(A)
ncol(A)
dim(A)
A
B
A + B
A * B
A == B
t(B)
# dot product
A %*% t(B)
A %*% C

colnames(A)
rownames(A)

colnames(A) <- c("Left", "Right")
row.names(A) <- c("1st", "2nd", "3rd", "4th", "5th")
A
B
letters
LETTERS
colnames(C) <- LETTERS[1:10]
rownames(C) <- c("Top", "Bottom")
C
