You can write & compile your R programs in C++ for faster execution.
We will need the Rcpp package, so make sure to install that before proceeding.

Take a look at Intro_to_cpp_in_R.cpp for an example for how to write a C++ function
and expose it to R.

You will then need to source your cpp file using...Rcpp::sourceCpp("./Intro_to_cpp_in_R.cpp")

Furthermore, there is a seamless integration between C++ & R due to some common data types
available in both languages.
