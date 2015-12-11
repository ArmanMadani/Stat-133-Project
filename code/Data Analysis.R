# Vector of total Field Goals Attempted per year
vec.fga <- all.champs$FGA
# Descriptive statistics
str(all.champs)
mean(vec.fga)
sd(vec.fga)
all.champs$Team[which.max(all.champs$FGA)]
all.champs$Team[which.min(all.champs$FGA)]

# Vector of Field Goal % per year
vec.fgp <- all.champs$FGP * 100

# Change in the total Field Goals Attempted Year-over-Year by Successful Teams
change.in.fga <- function(x = vec.fga) {
  output <- c()
  for (i in 1:(length(x) - 1)) {
    delta.fga <- x[i + 1] - x[i]
    output <- append(output, delta.fga)
  }
  return(output)
}


# Change in the Field Goal % Year-over-Year by Successful Teams
change.in.fgp <- function(x = vec.fgp) {
  output <- c()
  for (i in 1:(length(x) - 1)) {
    delta.fgp <- x[i + 1] - x[i]
    output <- append(output, delta.fgp)
  }
  return(output)
}