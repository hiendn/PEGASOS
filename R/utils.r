is.badval <- function(x)
{
   is.na(x) || is.nan(x) || is.infinite(x)
}

is.inty <- function(x)
{
  abs(x - round(x)) < 1e-10
}

is.zero <- function(x)
{
  abs(x) < 1e-10
}

is.negative <- function(x)
{
  x < 0
}

is.annoying <- function(x)
{
  length(x) != 1 || is.badval(x)
}



check.is.flag <- function(x)
{
  if (!is.logical(x) || is.annoying(x))
  {
    nm <- deparse(substitute(x))
    stop(paste0("argument '", nm, "' must be TRUE or FALSE"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.scalar <- function(x)
{
  if (!is.numeric(x) || is.annoying(x))
  {
    nm <- deparse(substitute(x))
    stop(paste0("argument '", nm, "' must be a single number (not NA, Inf, NaN)"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.posint <- function(x)
{
  if (!is.numeric(x) || is.annoying(x) || !is.inty(x) || is.negative(x) || is.zero(x))
  {
    nm <- deparse(substitute(x))
    stop(paste0("argument '", nm, "' must be a positive integer"), call.=FALSE)
  }
  
  invisible(TRUE)
}
