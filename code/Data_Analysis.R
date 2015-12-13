# Data Analysis

all_champs <- read.csv("data/champ_data.csv")

## ---- Data Analysis ----

# Vector of total Field Goals Attempted per year
vec_fga <- all_champs$FGA

# Descriptive statistics
mean(vec_fga)
sd(vec_fga)
all_champs$Team[which.max(all_champs$FGA)]
all_champs$Team[which.min(all_champs$FGA)]

# Vector of Field Goal % per year
vec_fgp <- all_champs$FGP * 100

# Descriptive statistics
mean(vec_fgp)
sd(vec_fgp)
all_champs$Team[which.max(all_champs$FGP)]
all_champs$Team[which.min(all_champs$FGP)]

# Change in the total Field Goals Attempted Year-over-Year by Successful Teams
change_in_fga <- function(x = vec_fga) {
  output <- c()
  for (i in 1:(length(x) - 1)) {
    delta_fga <- x[i + 1] - x[i]
    output <- append(output, delta_fga)
  }
  return(output)
}


# Change in the Field Goal % Year-over-Year by Successful Teams
change_in_fgp <- function(x = vec_fgp) {
  output <- c()
  for (i in 1:(length(x) - 1)) {
    delta_fgp <- x[i + 1] - x[i]
    output <- append(output, delta_fgp)
  }
  return(output)
}

# Average change in Field Goal Percentage over 20 years
mean(change_in_fgp())

# Vector of 3-Pt FGA per year
vec_3pfga <- all_champs$X3PA

# Descriptive statistics
mean(vec_3pfga)
sd(vec_3pfga)

# Vector of 3-Pt FG % per year
vec_3pfgp <- all_champs$X3PP * 100

# Descriptive statistics
mean(vec_3pfgp)
sd(vec_3pfgp)

# 3-Pt Attempts as a Percentage of Total Field Goal Attempts (Year to Year)
vec_3pfga/vec_fga * 100
