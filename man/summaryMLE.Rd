\name{summary.MLE}
\alias{summary.MLE}
\alias{summary.mult.MLE}
\alias{coef.summary.MLE}
\title{Summary the Maximum-Likelihood Estimation with the Inverse Hyperbolic Sine Distribution}
\description{
  Summary the maximum-likelihood estimation including standard errors and t-values.
}
\usage{
\method{summary}{MLE}(object, \dots)
\method{summary}{mult.MLE}(object, \dots)
}

\arguments{
  \item{object}{
    object of class \code{'MLE'} or of class \code{'mult.MLE'}, usually a result from
    maximum-likelihood estimation.
  }
  \item{\dots}{currently not used.}
}
\value{
  \code{summary.MLE} returns an
  object of class \code{'summary.MLE'} with the following components:
  \item{parameters}{names of parameters used in the estimation procedure.}
  \item{type}{type of maximisation.}
  \item{iterations}{number of iterations.}
  \item{code}{code of success.}
  \item{message}{a short message describing the code.}
  \item{loglik}{the loglik value in the maximum.}
  \item{estimate}{numeric matrix, the first column contains the parameter
    estimates, the second the standard errors, third t-values and fourth
    corresponding probabilities.}
  \item{fixed}{logical vector, which parameters are treated as constants.}
  \item{NActivePar}{number of free parameters.}
  \item{constraints}{information about the constrained optimization.
    Passed directly further from \code{maxim}-object.  \code{NULL} if
    unconstrained maximization.
  }
  \code{summary.mult.MLE} returns a list of class \code{'summary.mult.MLE'} with components of class \code{'summary.MLE'}. 
}
\author{Carter Davis, \email{carterdavis@byu.edu}}
\seealso{the \code{maxLik} CRAN package}
\examples{
### Showing how to fit a simple vector of data to the inverse 
### hyperbolic sine distribution. 
require(graphics)
require(stats)
set.seed(123456)
x = rnorm(100)
X.f = X ~ x
start = list(mu = 0, sigma = 2, lambda = 0, k = 1)
result = ihs.mle(X.f = X.f, start = start)
sumResult = summary(result)
print(result)
coef(result)
print(sumResult)

### Comparing the fit
xvals = seq(-5, 5, by = 0.05)
coefs = coef(result)
mu = coefs[1]
sigma = coefs[2]
lambda = coefs[3]
k = coefs[4]
plot(xvals, dnorm(xvals), type = "l", col = "blue")
lines(xvals, dihs(xvals, mu = mu, sigma = sigma, 
lambda = lambda, k = k), col = "red")
}
\keyword{models}
