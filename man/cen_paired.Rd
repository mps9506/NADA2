% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cen_paired.R
\name{cen_paired}
\alias{cen_paired}
\title{Censored data paired t-test}
\usage{
cen_paired(xd, xc, yd, yc, alternative = "two.sided", printstat = TRUE)
}
\arguments{
\item{xd}{The first column of data values plus detection limits}

\item{xc}{The column of censoring indicators, where 1 (or \code{TRUE}) indicates a detection limit in the xd column, and 0 (or \code{FALSE}) indicates a detected value in xd.}

\item{yd}{The second column of data values plus detection limits, or a single number representing a standard / guideline value.}

\item{yc}{The column of censoring indicators for yd, where 1 (or \code{TRUE}) indicates a detection limit in the yd column, and 0 (or \code{FALSE}) indicates a detected value in \code{yd}. Not needed if \code{yd} is a single standard number.}

\item{alternative}{The usual notation for the alternate hypothesis.  Default is \verb{“two.sided”}.  Options are \verb{“greater”} or \verb{“less”}.}

\item{printstat}{Logical \code{TRUE}/\code{FALSE} option of whether to print the resulting statistics in the console window, or not.  Default is \code{TRUE.}}
}
\value{
A list of statistics containing the following components:
\itemize{
\item \code{n} Number of observations
\item \code{Z} The value of the test statistic
\item \code{p.value} the p-value of the test
\item \verb{Mean difference} the mean difference between \code{xd} and \code{yd}
}
}
\description{
Performs a parametric test of whether the mean difference between two columns of paired censored data equals 0. Assumes that the paired differences follow a gaussian (normal) distribution.
}
\details{
You may also test for whether the mean of the \code{xd} data exceeds a standard by entering the single number for the standard as \code{yd}.  In that case no \code{yc} is required.
}
\examples{

data(atrazine)

cen_paired(atrazine$June,atrazine$JuneCen,atrazine$Sept,atrazine$SeptCen)

# Comparing standard/guieline value
cen_paired(atrazine$June, atrazine$JuneCen, 0.01, alternative = "greater")
}
\references{
Helsel, D.R., 2011. Statistics for Censored Environmental Data using Minitab and R, 2nd ed. John Wiley & Sons, USA, N.J.
}
\seealso{
\link[survival:survreg]{survival::survreg}
}
