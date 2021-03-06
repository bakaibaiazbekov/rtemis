# ddSci.R
# ::rtemis::
# 2015 Efstathios D. Gennatas egenn.github.io

#' Format Numbers for Printing
#'
#' 2 Decimal places, otherwise scientific notation
#' 
#' Numbers will be formatted to 2 decimal places, unless this results in 0.00 (e.g. if input was .0032),
#' in which case they will be converted to scientific notation with 2 significant figures.
#' \code{ddSci} will return \code{0.00} if the input is exactly zero.
#' This function can be used to format numbers in plots, on the console, in logs, etc.
#'
#' @param x Vector of numbers
#' @param decimal.places Integer: Return this many decimal places. Default = 2
#' @param asNumeric Logical: If TRUE, convert to numeric before returning. Default = FALSE.
#' This will not force all numbers to print 2 decimal places. For example:
#' 1.2035 becomes "1.20" if \code{asNumeric = FALSE}, but 1.2 otherwise
#' This can be helpful if you want to be able to use the output as numbers / not just for printing.
#' @return Formatted number
#' @author Efstathios D. Gennatas
#' @examples
#' x <- .34876549
#' ddSci(x)
#' # "0.35"
#' x <- .00000000457823
#' ddSci(x)
#' # "4.6e-09"
#' @export

ddSci <- function(x,
                  decimal.places = 2,
                  asNumeric = FALSE) {

  if (is.null(x)) if (asNumeric) return(NULL) else return("NULL")
  if (is.factor(x)) return(as.character(x))

  x <- as.list(unlist(x))

  x <- lapply(x, as.numeric)

  xf <- list()

  # Check for non-zero decimals
  decs <- sum(unlist(x) %% 1) > 0

  for (i in seq(x)) {
    if (is.na(x[[i]])) {
      xf[[i]] <- NA
    } else {
      if (decs & x[[i]] == 0) {
        xf[[i]] <- format(0, nsmall = 2)
      } else {
        if (decs) {
          xf[[i]] <- ifelse(round(x[[i]], 2) != 0,
                            format(round(x[[i]], decimal.places), nsmall = decimal.places),
                            format(x[[i]], scientific = TRUE, digits = 2))
        } else {
          xf[[i]] <- ifelse(abs(x[[i]]) >= 1e03, format(x[[i]], scientific = TRUE), as.character(x[[i]]))
        }
      }
    }
  }
  xf <- as.character(xf)
  if (asNumeric) xf <- as.numeric(xf)
  xf

} # rtemis::ddSci
