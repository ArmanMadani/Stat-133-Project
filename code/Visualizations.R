library(ggplot2)

data <- read.csv(file = "data/champ_data.csv", header = TRUE)[-c(1)]
data$X3PP <- data$X3PP * 100
data$FGP <- data$FGP * 100
data$X3PtFGA <- data$X3PA/data$FGA * 100

# Champion 3-Pt FGA Year-to-Year
qplot(x = years, y = X3PA, data = data, geom = c("point", "line"), 
  ylab = "3-Pt FGA", main = 'Champions 3-Pt FGA Over Time')

# Champion 3-Pt FGP Year-to-Year
qplot(x = years, y = X3PP, data = data, geom = c("point", "line"), 
  ylim = c(20, 50), ylab = "3 Pt. FG %", 
  main = 'Champions 3-Pt. FG % Over Time')

# Champion Field Goal Attempts (FGA) Year-to-Year
qplot(x = years, y = FGA, data = data, geom = c("point", "line"),
  ylab = "Total FGA", main = 'Champions Total FGA Over Time')

# Champion Field Goal Percentage (FGP) Year-to-Year
qplot(x = years, y = FGP, data = data, geom = c("point", "line"), 
  ylim = c(30, 60), ylab = "Total FG % ", 
  main = 'Champions Total FG % Over Time')

# 3-Pt Field Goals as a Percentage of Total Field Goals
qplot(x = years, y = X3PtFGA, data = data, geom = c("point", "line"),
  ylim = c(10, 35), ylab = "3-Pt/Total FGA", 
  main = 'Ratio of 3-Pt FG to Total FGA Over Time')

# Average height and weight of NBA Draft Picks 
players_unique <- data.frame(unique(players$Year), unique(players$`Average Height`), 
  unique(players$`Average Weight`))

qplot(x = unique(players$Year), y = unique(players$`Average Height`), 
  data = players_unique, geom = c("point", "line"), ylab = "Height", 
  xlab = "Year", ylim = c(60, 96), 
  main = 'Average Height of Draft Classes 1995 - 2015')

qplot(x = unique(players$Year), y = unique(players$`Average Weight`),
  data = players_unique, geom = c("point", "line"), ylab = "Weight",
  xlab = "Year", ylim = c(133, 375),
  main = "Average Weight of Draft Classes 1995 - 2015")

# Average height and weight of NBA Championship Lineups
champ$`Average Height`[champ$Year == 2003] <- 78.8001 
champ_unique <- data.frame(unique(champ$Year), unique(champ$`Average Height`), 
  unique(champ$`Average Weight`))

qplot(x = unique(champ$Year), y = unique(champ$`Average Height`),
  data = champ_unique, geom = c("point", "line"), ylab = "Height", 
  xlab = "Year", main = "Average Height of Championship Lineup",
  ylim = c(60, 96))

qplot(x = unique(champ$Year), y = unique(champ$`Average Weight`),
  data = champ_unique, geom = c("point", "line"), ylab = "Weight",
  xlab = "Year", main = "Average Weight of Championship Lineup", 
  ylim = c(133, 375))
