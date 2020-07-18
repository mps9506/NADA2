#' Censored data sample size
#'
#' @description Computes the equivalent sample size of censored data.  Observations at lower detection limits have more information than observations at higher detection limits.
#' @param y.var The column of data values plus detection limits.
#' @param cen.var The column of indicators, where 1 (or `TRUE`) indicates a detection limit in the `y.var` column, and 0 (or `FALSE`) indicates a detected value in `y.var`.
#' @param data an optional data frame, list or environment (or object coercible by `as.data.frame` to a data frame) containing the variables of interest.
#' @keywords Sample Size censored
#' @export
#' @importFrom NADA censummary
#' @details
#' Based on "Method 2" of Dr. Brenda Gillespie's talk at ASA National Meeting 2019.
#'
#' Differs in the method for computing the percentile probability for the detection limits.
#'
#' Computes the equivalent n, the number of observations including censored values, as a measure of information content for data with nondetects.
#'
#' @return Prints summary statistics including
#' \itemize{
#' \item `n` sample size
#' \item `n.cen` number of censored data
#' \item `pct.cen` precent censored data
#' \item `min` minimum reported value
#' \item `max` maximum reported value
#' }
#'
#' Summary of censored data including
#' \itemize{
#' \item `limit` detection limit
#' \item `n` number of censored values per limit
#' \item `uncen` number of uncensored values
#' \item `pexceed` proportion that exceeds the limit
#' }
#'
#' Summary of the equivalent sample size for detected and censored values.
#'
#' @references
#' Helsel, D.R., 2005. Nondetects and Data Analysis: Statistics for Censored Environmental Data, 1st ed. John Wiley and Sons, USA, N.J.
#'
#' @seealso \code{\link{[NADA]{censummary}}}
#'
#' @examples
#' library(NADA) #For example data
#'
#' data(DFe)
#'
#' equivalent_n(Summer,SummerCen,data=DFe)

equivalent_n <- function(y.var, y.cen,data){

  if(!missing(data)){
    y.var <- data[,deparse(substitute(y.var))]
    y.cen <- data[,deparse(substitute(y.cen))]
  }

  ycen <- as.logical(y.cen)
  yname <- deparse(substitute(y.var))

aa <- censummary(y.var, ycen)
n.equiv <- sum(aa$limits[,2]*aa$limits[,4] + aa$limits[,3])
n_total <- sum(aa$limits[,2] + aa$limits[,3])
n_detected <- sum(aa$limits[,3])
n_cens <- sum(aa$limits[,2])
n.cen.equiv <- sum(aa$limits[,2]*aa$limits[,4])
n.detected <- n.equiv - n.cen.equiv
message(yname); print(aa)
equiv.out <- data.frame(n.equiv,  n.cen.equiv, n.detected)
cat("equivalent sample size:", "\n")
print(equiv.out, row.names = FALSE, print.gap = 3)
aa[["equivalent"]] <- equiv.out
return (invisible (aa))
}