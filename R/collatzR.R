#' Determine if a number is even
#'
#' @param x A numeric value.
#'
#' @return TRUE if the number is even, FALSE otherwise.
#' @export
is.even <- function(x) {
  return(x %% 2 == 0)
}

#' Check if a number is a whole number (integer)
#'
#' @param x A numeric value.
# @param tolerance A tolerance level to consider the number as a whole number.
#'
#' @return TRUE if the number is a whole number, FALSE otherwise.
#' @export
is.wholenumber <- function(x, tolerance = .Machine$double.eps^0.5)
  abs(x - round(x)) < tolerance

#' Perform the Collatz operation on a number
#'
#' @param n A numeric value.
#'
#' @return The result of the Collatz operation.
#' @export
collatz <- function(n) {
  if (is.even(n)) {
    return(n / 2)
  } else {
    return(3 * n + 1)
  }
}

#' Generate a Collatz sequence for a given starting number
#'
#' @param start The starting number for the sequence.
#'
#' @return A list with the following components:
#'   - 'sequence': A numeric vector representing the Collatz sequence.
#'   - 'steps': The total number of steps to reach 1.
#'   - 'max_value': The maximum value in the Collatz sequence.
#' @export
collatz_sequence <- function(start) {
  if (!is.wholenumber(start) || start <= 0) {
    stop("Starting number must be a positive integer.")
  }
  n_total <- c(start)
  n <- start
  steps <- 0
  while (n != 1) {
    n <- collatz(n)
    n_total <- c(n_total, n)
    steps <- steps + 1
  }
  result <- list(
    sequence = n_total,
    steps = steps,
    max_value = max(n_total)
  )
  return(result)
}

#' Visualize a Collatz sequence
#'
#' @param start The starting number for the sequence.
#'
#' @export
visualize_collatz <- function(start) {
  result <- collatz_sequence(start)

  # Add the current date below the plot
  main_title <- paste("Collatz conjecture plot for:", start)
  plot(result$sequence, type = 'l', col = 'blue', main = main_title, xlab = 'Step', ylab = 'Value')

  # Create a table of results
  print_formula <- ifelse(is.even(start),
                          paste("f(n) = n / 2", sep = ""),
                          paste("f(n) = 3n + 1", sep = ""))
  date_time_printed <- format(Sys.time(), format = "%Y-%m-%d %H:%M:%S")
  result_table <- data.frame(
    "Parameter" = c("Starting value (n)","Initial formula taken to be", "Initial value given f(n)", "Total steps to reach 1", "Maximum value in sequence","Printed on"),
    "Value" = c(start, print_formula, collatz(start), result$steps, result$max_value, date_time_printed)
  )

  # Print the table using knitr::kable
  knitr::kable(result_table, format = "markdown")
}

#' Get the maximum value in a Collatz sequence
#'
#' @param start The starting number for the sequence.
#'
#' @return The maximum value in the Collatz sequence.
#' @export
max_collatz <- function(start) {
  result <- collatz_sequence(start)
  return(result$max_value)
}
