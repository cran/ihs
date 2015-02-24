\name{ihs}
\alias{IHS}
\alias{ihs}
\alias{dihs}
\alias{pihs}
\alias{qihs}
\alias{rihs}

\title{The Inverse Hyperbolic Sine Distribution}
\description{
  Density, distribution function, quantile function and random
  generation for the inverse hyperbolic sine distribution.
}
\usage{
dihs(x, mu = 0, sigma = SIGCONST, lambda = 0, k = 1, log = FALSE) 
pihs(q, mu = 0, sigma = SIGCONST, lambda = 0, k = 1, lower.tail = TRUE, 
log.p = FALSE) 
qihs(p, mu = 0, sigma = SIGCONST, lambda = 0, k = 1, lower.tail = TRUE, 
log.p = FALSE) 
rihs(n, mu = 0, sigma = SIGCONST, lambda = 0, k = 1)
}
\arguments{
  \item{x, q}{vector of quantiles.}
  \item{p}{vector of probabilities.}
  \item{n}{number of observations. If \code{length(n) > 1}, the length
    is taken to be the number required.}
  \item{mu}{vector of means. The default value is \code{0}.}
  \item{sigma}{vector of standard deviations. The default value is \code{sqrt((exp(2)-1)/2)}.}
  \item{lambda}{vector of skewness parameters. If \code{lambda < 0}, the distribution is skewed to the left. If \code{lambda > 0}, the distribution is skewed to the right. If \code{lambda = 0}, then the distribution is symmetric.}
  \item{k}{vector of parameters. This parameter controls the skewness of the distribution.}
  \item{log, log.p}{logical; if TRUE, probabilities p are given as log(p).}
  \item{lower.tail}{logical; if TRUE (default), probabilities are
    \eqn{P[X \le x]} otherwise, \eqn{P[X > x]}.}
}
\value{
  \code{dihs} gives the density,
  \code{pihs} gives the distribution function,
  \code{qihs} gives the quantile function, and
  \code{rihs} generates random deviates.
  
  The length of the result is determined by \code{n} for
  \code{rihs}, and is the maximum of the lengths of the
  numerical arguments for the other functions.  
  
  The numerical arguments other than \code{n} are recycled to the
  length of the result.  Only the first elements of the logical
  arguments are used.
  
  \code{sigma <= 0} and \code{k <= 0} are errors and return \code{NaN}.
}
\author{Carter Davis, \email{carterdavis@byu.edu}}
\details{
  If \code{mu}, \code{sigma}, \code{lambda}, or \code{k} are not specified they assume the default values of \code{mu = 0}, \code{sigma} is approximately \code{sqrt((exp(2)-1)/2)}, \code{lambda = 0}, and \code{k = 1}. These default values give the distribution \code{sinh(z)}, where \code{z} is a standard normal random variable.

  An inverse hyperbolic sine random variable \eqn{Y} is defined by the transformation
  \deqn{
  		Y = a + b*sinh( \lambda + Z/k)
  }
  where \eqn{Z} is a standard normal random variable, and \eqn{a}, \eqn{b}, \eqn{\lambda}, and \eqn{k} control the mean, variance, skewness, and kurtosis respectively. 
  Thus the inverse hyperbolic sine distribution has density
  \deqn{ 	
  	    f(x) = \frac{k e^{(-k^2/2) (log ( \frac{x-a}{b} + (\frac{(x-a)^2}{b^2} + 1)^{1/2}) - \lambda )^2}}{\sqrt{2 \pi ((a-x)^2+b^2)}}
  }
  and if we reparametrize the distribution so that the parameters include the mean (\eqn{\mu}) and the standard deviation (\eqn{\sigma}) instead of \eqn{a} and \eqn{b}, then we let
  \deqn{
  		b = \frac{2 \sigma}{\sqrt{( e^{2 \lambda + k^{-2}} + e^{-2 \lambda + k^{-2}} + 2 ) ( e^{k^{-2}} - 1 )}}
  }
  \deqn{
		a = \mu - \frac{b}{2} (( e^{\lambda} - e^{-\lambda} ) e^{\frac{1}{2 k^2}} )  
  }
  Thus if \eqn{\mu = 0}, \eqn{\sigma = \sqrt{\frac{e^2-1}{2}}}, \eqn{\lambda = 0}, and \eqn{k = 1}, then \eqn{Y = sinh(Z)}.
}
\seealso{
  \link{Distributions} for other standard distributions such as \code{\link{dnorm}} for the normal distribution and \code{\link{dlnorm}} for the log-normal distribution, which is also a transformation of a normal random variable. 
}
\source{
  \code{dihs} is calculated from the definition (in `Details'). \code{[pqr]ihs} are based on the relationship to the normal.
}
\references{
  
  Hansen, C., McDonald, J. B., and Theodossiou, P. (2007)
  "Some Flexible Parametric Models for Partially Adaptive Estimators of Econometric Models"
  \emph{Economics - The Open-Access, Open-Assessment E-Journal}, volume 1, 1-20.
  
  Hansen, C., McDonald, J. B., and Newey, W. K. (2010)
  "Instrumental Variables Regression with Flexible Distributions"
  \emph{Journal of Business and Economic Statistics}, volume 28, 13-25.
  
}
\examples{
require(graphics)

### This shows how default values of the IHS compare
### to a standard normal.
x = seq(-5,5,by=0.05)
plot(x, dnorm(x), type='l')
lines(x, dihs(x), col='blue')

pihs(0)
pihs(0, lambda = -0.5)
}
\keyword{distribution}