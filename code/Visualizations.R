library(ggplot2)

data <- read.csv(file = "data/champ_data.csv", header = TRUE)[-c(1)]
data$X3PP <- data$X3PP * 100
data$FGP <- data$FGP * 100
data$X3PtFGA <- data$X3PA/data$FGA * 100

# Champion 3-Pt FGA Year-to-Year
qplot(x = years, y = X3PA, data = data, geom = c("point", "line"), 
      ylab = "3-Pt FGA", main = 'Champions 3-Pt FGA Over Time')
ggsave(file = "images/3pt_fga.pdf")
ggsave(file = "images/3pt_fga.png")

# Champion 3-Pt FGP Year-to-Year
qplot(x = years, y = X3PP, data = data, geom = c("point", "line"), 
      ylim = c(20, 50), ylab = "3 Pt. FG %", 
      main = 'Champions 3-Pt. FG % Over Time')
ggsave(file = "images/3pt_percent_fga.pdf")
ggsave(file = "images/3pt_percent_fga.png")

# Champion Field Goal Attempts (FGA) Year-to-Year
qplot(x = years, y = FGA, data = data, geom = c("point", "line"),
      ylab = "Total FGA", main = 'Champions Total FGA Over Time')
ggsave(file = "images/total_fga.pdf")
ggsave(file = "images/total_fga.png")

# Champion Field Goal Percentage (FGP) Year-to-Year
qplot(x = years, y = FGP, data = data, geom = c("point", "line"), 
      ylim = c(30, 60), ylab = "Total FG % ", 
      main = 'Champions Total FG % Over Time')
ggsave(file = "images/total_percent_fga.pdf")
ggsave(file = "images/total_percent_fga.png")

# 3-Pt Field Goals as a Percentage of Total Field Goals
qplot(x = years, y = X3PtFGA, data = data, geom = c("point", "line"),
      ylim = c(10, 35), ylab = "3-Pt/Total FGA", 
      main = 'Ratio of 3-Pt FG to Total FGA Over Time')
ggsave(file = "images/3pt_total_ratio.pdf")
ggsave(file = "images/3pt_total_ratio.png")

# Average height and weight of NBA Draft Picks 
players <- read.csv(file = "data/players.csv", header = TRUE)
players_unique <- data.frame(unique(players$Year), 
                             unique(players$Average_Height), 
                             unique(players$Average_Weight))

qplot(x = unique(players$Year), y = unique(players$Average_Height), 
      data = players_unique, geom = c("point", "line"), ylab = "Height", 
      xlab = "Year", ylim = c(60, 96), 
      main = 'Average Height of Draft Classes')
ggsave(file = "images/draft_height.pdf")
ggsave(file = "images/draft_height.png")

qplot(x = unique(players$Year), y = unique(players$Average_Weight),
      data = players_unique, geom = c("point", "line"), ylab = "Weight",
      xlab = "Year", ylim = c(133, 375),
      main = "Average Weight of Draft Classes")
ggsave(file = "images/draft_weight.pdf")
ggsave(file = "images/draft_weight.png")

# Average height and weight of NBA Championship Lineups
champ <- read.csv(file = "data/roster.csv", header = TRUE)
champ$Average_Height[champ$Year == 2003] <- 78.8001
champ_unique <- data.frame(unique(champ$Year), unique(champ$Average_Height), 
                           unique(champ$Average_Weight))

qplot(x = unique(champ$Year), y = unique(champ$Average_Height),
      data = champ_unique, geom = c("point", "line"), ylab = "Height", 
      xlab = "Year", main = "Average Height of Championship Lineup",
      ylim = c(60, 96))
ggsave(file = "images/champ_height.pdf")
ggsave(file = "images/champ_height.png")

qplot(x = unique(champ$Year), y = unique(champ$Average_Weight),
      data = champ_unique, geom = c("point", "line"), ylab = "Weight",
      xlab = "Year", main = "Average Weight of Championship Lineup", 
      ylim = c(133, 375))
ggsave(file = "images/champ_weight.pdf")
ggsave(file = "images/champ_weight.png")

## ---- Visualization ----

# Champion 3-Pt FGA Year-to-Year
qplot(x = years, y = X3PA, data = data, geom = c("point", "line"), 
      ylab = "3-Pt FGA", main = 'Champions 3-Pt FGA Over Time') + 
  theme(plot.title = element_text(size=12))

# Champion 3-Pt FGP Year-to-Year
qplot(x = years, y = X3PP, data = data, geom = c("point", "line"), 
      ylim = c(20, 50), ylab = "3 Pt. FG %", 
      main = 'Champions 3-Pt. FG % Over Time') +
  theme(plot.title = element_text(size=12))

# Champion Field Goal Attempts (FGA) Year-to-Year
qplot(x = years, y = FGA, data = data, geom = c("point", "line"),
      ylab = "Total FGA", main = 'Champions Total FGA Over Time') +
  theme(plot.title = element_text(size=12))

# Champion Field Goal Percentage (FGP) Year-to-Year
qplot(x = years, y = FGP, data = data, geom = c("point", "line"), 
      ylim = c(30, 60), ylab = "Total FG % ", 
      main = 'Champions Total FG % Over Time') +
  theme(plot.title = element_text(size=12))

# 3-Pt Field Goals as a Percentage of Total Field Goals
qplot(x = years, y = X3PtFGA, data = data, geom = c("point", "line"),
      ylim = c(10, 35), ylab = "3-Pt/Total FGA", 
      main = 'Ratio of 3-Pt FG to Total FGA Over Time') +
  theme(plot.title = element_text(size=12))

# Average height and weight of NBA Draft Picks
qplot(x = unique(players$Year), y = unique(players$Average_Height), 
      data = players_unique, geom = c("point", "line"), ylab = "Height", 
      xlab = "Year", ylim = c(60, 96), 
      main = 'Average Height of Draft Classes') +
  theme(plot.title = element_text(size=12))

qplot(x = unique(players$Year), y = unique(players$Average_Weight),
      data = players_unique, geom = c("point", "line"), ylab = "Weight",
      xlab = "Year", ylim = c(133, 375),
      main = "Average Weight of Draft Classes") +
  theme(plot.title = element_text(size=12))

# Average height and weight of NBA Championship Lineups
qplot(x = unique(champ$Year), y = unique(champ$Average_Height),
      data = champ_unique, geom = c("point", "line"), ylab = "Height", 
      xlab = "Year", main = "Average Height of Championship Lineup",
      ylim = c(60, 96)) +
  theme(plot.title = element_text(size=12))

qplot(x = unique(champ$Year), y = unique(champ$Average_Weight),
      data = champ_unique, geom = c("point", "line"), ylab = "Weight",
      xlab = "Year", main = "Average Weight of Championship Lineup", 
      ylim = c(133, 375)) +
  theme(plot.title = element_text(size=12))
