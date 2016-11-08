say.hello <- function()
{
  print("hello world")
}
say.hello
say.hello()

sprintf("hello %s", "Armen")
sprintf("hello %s, today is %s", "Armen", "Sunday")

# func args
hello.person <- function(name)
{
  print(sprintf("Hello %s", name))
}
hello.person("Armen")

hello.person <- function(first, last)
{
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Armen", "Babalu")
# positional & named args
hello.person(last="Babalu", first="Armen")
hello.person("Armen", last="Babalu")

#default arg
hello.person <- function(first, last="Doe")
{
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Armen")
hello.person("Armen", "Babalu")
# throw error
hello.person("Armen", extra="Bye")

# ... is super powerful, but let's see a simple example
hello.person <- function(first, last="Johnson",...)
{
    print(sprintf("Hello %s %s", first, last))
}
hello.person("Armen", "Babalu", "Bye")
# ignore extra param
hello.person("Armen", "Babalu", extra = "Bye")

double.num <- function(x)
{
  x * 2
}
double.num(3)

double.num <- function(x)
{
  return (x * 2)
}
double.num(3)

hello.person <- function(first, last="Babalu", ...)
{
  print(sprintf("Hello %s %s", first, last))
}
hello.person("Armen", "Babalu")

# do.call constructs and executes a function call from a name or a function and 
# a list of arguments to be passed to it.
do.call("hello.person", args= list(first="Armen", last="Babalu"))
do.call(hello.person, args= list(first="Armen", last="Babalu"))

run.this <- function(x, func=mean)
{
  do.call(func, args=list(x))
}
run.this(1:10)
run.this(1:10, mean)
run.this(1:10, sd)

1==1
1 <= 1
1 > 1 
1 != 1

toCheck <- 1
if (toCheck ==1)
{
    print("hello")
}

check.bool <- function(x)
{
  if(x==1)
  {
    print("hello")
  } else 
  {
    print("goodbye")
  }
}

check.bool(1)
check.bool(2)
check.bool("k")
check.bool(TRUE)

check.bool <- function(x)
{
  if(x==1)
  {
    print("hello")
  } else if (x==0)
  {
    print("goodbye")
  } else
  {
    print("confused") 
  }
}
check.bool(0)
check.bool(1)
check.bool(2)

use.switch <- function(x)
{
  switch(x,
         "a" = "first",
         "b" = "second",
         "c" = "thrid",
         "other")
}
use.switch("a")
use.switch("b")
use.switch(1)

# ifelse is more efficient for vectors
ifelse(1 == 1, "Yes", "No")
ifelse(1 == 0, "Yes", "No")

toTest <- c(1,1,0,1,0,1)
ifelse(toTest ==1, "Yes", "No")
ifelse(toTest ==1, toTest*3, toTest)
ifelse(toTest ==1, toTest*3, "zero")

toTest[2] <- NA
toTest
ifelse(toTest ==1, toTest*3, "zero")

a<- c(1,1,0,1)
b<- c(2,1,0,1)
ifelse(a == 1 & b == 1, "Yes", "No")
# checks only 1st, short circuits
ifelse(a == 1 && b == 1, "Yes", "No")

x <- 1
y <- 2
# short circuits 
if( x==0 && y ==3)
{
  print("hello")
}

x <- 1
y <- 2
# short circuits 
if( x==1 || y ==3)
{
  print("hello")
}

# nested ifelse
ifelse(b==1, "hi", ifelse(b==0, "hello", "goodbye"))

for(i in 1:10)
{
  print(i)
}
print(1:10)

fruit <- c("apple", "banana", "orange")
fruitLength <- rep(NA, length(fruit))
fruitLength
names(fruitLength) <- fruit
fruitLength

for(a in fruit)
{
  fruitLength[a] <- nchar(a)
}  
fruitLength  
a
fruitLength2 <- nchar(fruit)
fruitLength2
names(fruitLength2) <- fruit
fruitLength2
identical(fruitLength, fruitLength2)

x <- 1
while(x <= 5)
{
  print(x)
  x <- x + 1
}

for (i in 1:10)
{
  if(i ==3 )
  {
    next
  }
  print(i)
}

for (i in 1:10)
{
  if(i ==4 )
  {
    break
  }
  print(i)
}