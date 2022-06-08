#' Data of habitual diet
#'
#' Shrimp are classified by size, 0-15 shrimp per pound, 15-20 shrimp per pound, etc. A smaller number per pound indicates larger shrimp. Nominal prices are total monthly value of brown shrimp andings within size class divided by total monthly landings within the size class.
#'
#' @format A tibble with 462 rows and 41 variables:
#' \describe{
#'   \item{ID}{dbl person ID
#'   \item{gender}{fct}
#'   \item{age}{dbl age of person}
#'   \item{city}{dbl residency (urban/city = 1, countryside = 2)}
#'   \item{household}{dbl household classes}
#'   \item{children}{dbl number of children+1}
#'   \item{educatiion}{dbl education classes}
#'   \item{income}{dbl income classes}
#' }
#' @source \url{https://doi.org/10.1016/j.foodqual.2018.10.012}
"plantbaseddiet"
