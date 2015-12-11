library(ggplot2)

data <- read.csv(file = "../data/champdata.csv", header = TRUE)[-c(1)]
data$X3PP <- data$X3PP * 100

qplot(x = years, y = X3PA, data = data, geom = c("point", "line"), 
      ylab = "Champions’ 3 Pt. FGA")
qplot(x = years, y = X3PP, data = data, geom = c("point", "line"), 
      ylim = c(20, 50), ylab = "Champions’ 3 % Pt. FGA")

