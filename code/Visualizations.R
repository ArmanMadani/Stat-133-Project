library(ggplot2)

data <- read.csv(file = "data/champ_data.csv", header = TRUE)[-c(1)]
data$X3PP <- data$X3PP * 100
data$FGP <- data$FGP * 100

# Champion 3-Pt FGA Year-to-Year
qplot(x = years, y = X3PA, data = data, geom = c("point", "line"), 
  ylab = "3-Pt FGA", main = 'Champions 3-Pt FGA Over Time')

# Champion 3-Pt FGP Year-to-Year
qplot(x = years, y = X3PP, data = data, geom = c("point", "line"), 
  ylim = c(20, 50), ylab = "3 Pt. FG %", main = 'Champions 3-Pt. FG % Over Time')

# Champion Field Goal Attempts (FGA) Year-to-Year
qplot(x = years, y = FGA, data = data, geom = c("point", "line"),
  ylab = "Total FGA", main = 'Champions Total FGA Over Time')

# Champion Field Goal Percentage (FGP) Year-to-Year
qplot(x = years, y = FGP, data = data, geom = c("point", "line"), 
  ylim = c(30, 60), ylab = "Total FG % ", main = 'Champions Total FG % Over Time')
