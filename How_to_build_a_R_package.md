# So you want to build a R package...
Here's a quick step by step tutorial for how to do it. You will want to install `roxygen2` & `devtools` packages which will come in handy when you're ready to document your package.

### Step 1: Create a new RStudio R package project

File -> New Project ...

### Step 2:   Create the desired folder hierarchy structure:

```
R/: for all the R code (required)
man/: for documentation (required)
data/: for data files required by your package  
inst/: any files you'll want to include for installation
src/: if you're including compiled code (C++ or Fortran)
test/: goes without saying
```

### Step 3: Update your DESCRIPTION file 
`DESCRIPTION` file should look something like the following:

```
Package: Add
Type: Package
Title: Add package helps you add two numbers
Version: 0.1.0
Author: Armen Donigian
Maintainer: Armen Donigian
<yourfault@somewhere.net>
Description: Helps you do addition
License: What license is it under?
LazyData: TRUE
RoxygenNote: 5.0.1
Imports:
  plyr
Depends:
  ggplo2

```
**Note:** Imports & Depends will both install the respective packages. The difference is that your end users will not be able to access anything listed in Imports after they require your package. As a result, you should put as many packages as you need in Imports and only what you need loaded in Depends.

### Step 4: Implement your function 
In my example, I'll implement `Addition.r`

```
#' @title addition.ex
#' @description Add Example
#' @details This is a simple ex of a function
#' @aliases addition.ex
#' @author armen
#' @export addition.ex
#' @import plyr
#' @param x A numeric vector
#' @param y A numeric vector
#' @return x add y
#' @examples
#' simple.ex(1,1)
#' simple.ex(1:5, 6:10)
addition.ex <- function(x,y)
{
  return (x+y)
}

```
Note: name your files with lowercase (.r) file name extension as (.R) is an older naming convention.

### Step 5: Create documention
Go to RStudio command console and type `document()`.  This will create a documentation file under `man` directory & update `NAMESPACE` file with the proper import/export dependencies. Make sure to `require(devtools)` & `require(roxygen2)`.

### Step 6: Test your code 
Writing tests for your package is a good idea. There are few tools you can use such as `runit` or `testthat` packages. 

- You'll want to install the `testthat` package. 
- Next, you'll want to type into RStudio command console `use_testthat()` which will create the infrastucture for testing (`tests/testthat.R` & `tests/testthat` folder). 
- type `use_test(addition.ex)` to generate a test file for your code `tests/testthat/test-simple.ex.R`. 

```
context("addition.ex works properly")

test_that("addition works", {
  expect_equal(2 + 2, 4)
})

test_that("addition.ex gives a wanring with mismatched sized vectors", {
  expect_warning(addition.ex(1:5, 1:3))
})

```
- type `load_all()` & run your test code

### Step 7: Check & Build a package
Go to RStudio command console and type `check()` followed by `build()`. This will create a `.tar.gz` file which contains your package. You can optionally do `build(binary=TRUE)` to build a zip file. Zip file makes sense if you have a large package or compiled code in your package which you wouldn't want your end users to deal with.

### Step 8: Submit your package to CRAN
Visit [https://cran.r-project.org/submit.html](https://cran.r-project.org/submit.html) & profit.