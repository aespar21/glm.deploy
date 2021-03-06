% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glm.deploy.R
\name{glm2c}
\alias{glm2c}
\title{C source code generator for rapid deployment of glm predictive models}
\usage{
glm2c(model, filename = NULL, path = NULL)
}
\arguments{
\item{model}{A fitted object of class "glm".}

\item{filename}{OPTIONAL The name of the output file(s), the default filenames are "glm_xxx.c" and "glm_xxx.h", where xxx is the target variable's name.}

\item{path}{The directory path where files are going to be saved.}
}
\description{
The \code{glm2c()} function is used to generate source code in C language
implementing a given glm predictive model. It implements the following two functions;
 the glm_xxx_response() and glm_xxx_link(), where xxx stands for the name of the target variable
 of the glm object.\cr \cr
After the invocation of the \code{glm2c()} function two files are generated:\cr
\itemize{
  \item A .c file with the two scoring functions.\cr
  \item An .h file with the prototypes of the two functions of the .c file.\cr
 }
}
\note{
All numeric variables used as input to the glm object are treated as doubles, whereas factor variables are treated as strings.
}
\examples{

 # Example with the iris dataset with a Logical target and numeric variables,
 # using the binomial family and the logit link function
 data(iris)
 iristest = iris
 iristest$Virginica = ifelse(iristest$Species == 'virginica', TRUE,FALSE)
 iristest$Species = NULL

 # Load Package
 library(glm.deploy)
 # For repeatable results
 set.seed(123)
 # Generate the fitted glm object
 m = glm(Virginica ~ ., family = binomial(logit), data=iristest)
 # Call the glm2c() function with default filename
 glm2c(m,,tempdir())

 # Call the glm2c() function with custom filename
 glm2c(m,'my_glm_virginica', tempdir())

 # The glm2c() function generates the files: "glm_virginica.c" and
 # "glm_virginica.h"

\dontrun{
---------------Contents of the "glm_virgninica.c" file---------------

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

double glm_virginica_link(double sepal_length,
                          double sepal_width,
                          double petal_length,
                          double petal_width){
  double new_sepal_length = -2.46522019518341 * sepal_length;
  double new_sepal_width = -6.68088701405762 * sepal_width;
  double new_petal_length = 9.4293851538836 * petal_length;
  double new_petal_width = 18.2861368877881 * petal_width;

  return -42.6378038127854+new_sepal_length+
                           new_sepal_width+
                           new_petal_length+
                           new_petal_width;
}
double glm_virginica_response(double sepal_length,
                              double sepal_width,
                              double petal_length,
                              double petal_width){
  return 1/(1+exp(-glm_virginica_link(sepal_length,
                                      sepal_width,
                                      petal_length,
                                      petal_width)));
}
----End of Contents of the "glm_virgninica.c" file------------------
--------------------------------------------------------------------

-----Contents of the "glm_virgninica.h" file------------------------
double glm_virginica_link(double sepal_length,
                          double sepal_width,
                          double petal_length,
                          double petal_width);
double glm_virginica_response(double sepal_length,
                              double sepal_width,
                              double petal_length,
                              double petal_width);
-----End of Contents of the "glm_virgninica.h" file-----------------
--------------------------------------------------------------------

Usage of the functions in another programs;
1) We need to add an include line #include "virginica_glm.h" to all
source files that use library definitions.
2) Link the .c file with the library object file.
    gcc -c glm_virginica.c
3) The following is an example file "test.c" to call the functions
and print the result:

-------------------"test.c"---------------
#include <stdio.h>
#include "glm_virgnica.h" //Added to call the scoring functions.

int main(int argc, char *argv[]){
  printf("\%f\\n",glm_virginica_link(5.7,2.5,5.0,2.0));
  printf("\%f\\n",glm_virginica_response(5.7,2.5,5.0,2.0));
  return 0;
}
---------------End of "test.c"---------------
---------------------------------------------

4) Compile the "test.c" file and link it to the glm_virginica shared
library, we also need to add the "-lm" option to link it to the
math.h library:
gcc test.c -o test glm_virginica.o -lm

5) Finally Run the test.o program in linux:
./test
}
}
\seealso{
\code{\link{glm2java}}
}
\author{
Oscar Castro-Lopez, Ines Vega-Lopez
}
