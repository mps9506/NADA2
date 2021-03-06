% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Usci.R
\name{Usci}
\alias{Usci}
\title{Interval-censored U-Score}
\usage{
Usci(ylo, yhi, rnk = TRUE)
}
\arguments{
\item{ylo}{The lower end of the concentration interval}

\item{yhi}{The upper end of the concentration interval}

\item{rnk}{A \code{TRUE}/\code{FALSE} variable on whether to compute the multivariate pattern on the uscores, or the ranks of the uscores.  Default is rnk=\code{TRUE}, use the ranks. rnk = \code{FALSE} returns the uscores.}
}
\value{
Returns a single column of uscores or the ranks of uscores for a single pair of (low, high) interval-censored data columns.
}
\description{
Interval-censored computation of uscores and their ranks for 1 parameter.  Called by uscoresi. Usci is not expected to be of much use to users on its own.
}
\examples{

data(Brumbaugh)

# for demonstration purposes create a lower end concentration interval
Brumbaugh$lowHg<-Brumbaugh$Hg*(1-Brumbaugh$HgCen)

with(Brumbaugh,Usci(lowHg,Hg))
}
