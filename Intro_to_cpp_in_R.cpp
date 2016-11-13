#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int multiplyThree(int number)
{
  return number * 3;
}

// [[Rcpp::export]]
NumericVector add(NumericVector a, NumericVector b)
{
  int n = a.size();
  NumericVector result(n);

  for(int i = 0; i < n; ++i)
  {
    result[i] = a[i] + b[i];
  }
  return result;
}

// [[Rcpp::export]]
NumericVector addition(NumericVector a, NumericVector b)
{
  return a + b;
}

// [[Rcpp::export]]
double calculate_sum(NumericVector x)
{
  return sum(x);
}
