# Case Study of Different NBA Players

## ---- Gather Data ----

# Stephen Curry: 3-Pt. Specialist
# 3-Pt Attempts Per Game
steph_curry_stats <- read.csv("data/steph_curry_stats.csv")
steph_curry_3PA <- as.vector(steph_curry_stats$`X3PA`)
steph_curry_3PA <- steph_curry_3PA[-c(3, 7)] 
# Positions 3 and 7 omitted because of injury and seasons in progress
steph_curry_3PA <- as.numeric(steph_curry_3PA)
steph_curry_3PA <- mean(steph_curry_3PA)
# 3-Pt Percentage
steph_curry_3PP <- as.vector(steph_curry_stats$`X3P.`)
steph_curry_3PP <- steph_curry_3PP[-c(3, 7)]
steph_curry_3PP <- as.numeric(steph_curry_3PP)
steph_curry_3PP <- steph_curry_3PP * 100
steph_curry_3PP <- mean(steph_curry_3PP)
# Total FG Percentage
steph_curry_FGP <- as.vector(steph_curry_stats$`FG.`)
steph_curry_FGP <- as.numeric(steph_curry_FGP) * 100
steph_curry_FGP <- mean(steph_curry_FGP)
# Ratio 3-Pt.:Total FGA
steph_curry_ratio <- as.vector(steph_curry_stats$`X3PA`)
steph_curry_ratio <-steph_curry_ratio[-c(3, 7)]
steph_curry_ratio <- as.numeric(steph_curry_ratio)
steph_curry_FGA <- as.vector(steph_curry_stats$FGA)
steph_curry_FGA <- steph_curry_FGA[-c(3, 7)]
steph_curry_FGA <- as.numeric(steph_curry_FGA)
steph_curry_ratio <- (steph_curry_ratio/steph_curry_FGA) * 100
mean(steph_curry_ratio)
# Stephen Curry: Physical Attributes
steph_curry <- read.csv('data/steph_curry.csv')
steph_curry_height <- steph_curry$`Height.w.shoes`
steph_curry_weight <- as.vector(steph_curry$Weight)
steph_curry_weight <- as.numeric(steph_curry_weight)

# Draymond Green: Power Forward (Short for Position)
# 3-Pt Attempts
draymond_green_stats <- read.csv("data/draymond_green_stats.csv")
draymond_green_3PA <- as.vector(draymond_green_stats$`X3PtA`)
draymond_green_3PA <- as.numeric(draymond_green_3PA)
# 3-Pt Percentage
draymond_green_3PP <- as.vector(draymond_green_stats$`X3P.`)
draymond_green_3PP <- as.numeric(draymond_green_3PP)
# Total FG Percentage
draymond_green_FGP <- as.vector(draymond_green_stats$`FG.`)
draymond_green_FGP <- as.numeric(draymond_green_FGP)
# Ratio 3-Pt:Total FGA
draymond_green_FGA <- as.vector(draymond_green_stats$FGA)
draymond_green_FGA <- as.numeric(draymond_green_FGA)
draymond_green_ratio <- (draymond_green_3PA/draymond_green_FGA) * 100
# Draymond Green: Physical Attributes
draymond_green <- read.csv("data/draymond_green.csv")
draymond_green_height <- draymond_green$`Height.w.shoes`
draymond_green_weight <- as.vector(draymond_green$Weight)
draymond_green_weight <- as.numeric(draymond_green_weight)

# Tim Duncan: Power Forward (Large for Position)
# 3-Pt Attempts
tim_duncan_stats <- read.csv("data/tim_duncan_stats.csv")
tim_duncan_3PA <- as.vector(tim_duncan_stats$`X3PtA`)
tim_duncan_3PA <- as.numeric(tim_duncan_3PA)
# 3-Pt Percentage
tim_duncan_3PP <- as.vector(tim_duncan_stats$`X3P.`)
tim_duncan_3PP <- as.numeric(tim_duncan_3PP)
# Total FG Percentage
tim_duncan_FGP <- as.vector(tim_duncan_stats$`FG.`)
tim_duncan_FGP <- as.numeric(tim_duncan_FGP)
# Tim Duncan: Physical Attributes
tim_duncan <- read.csv("data/tim_duncan.csv")
tim_duncan_height <- tim_duncan$`Height.w.o.Shoes`
tim_duncan_weight <- as.vector(tim_duncan$Weight)
tim_duncan_weight <- as.numeric(tim_duncan_weight)

# Shaq: Dominant Center
# 3-Pt Field Goals negligibly small, 2 attempted over 19 year career
# Shaq: Physical Attributes
shaq <- read.csv("data/shaq.csv")
shaq_height <- shaq$`Height.w.o.Shoes`
shaq_weight <- as.vector(shaq$Weight)
shaq_weight <- as.numeric(shaq_weight)

# Create Data Frame
heights <- c(steph_curry_height, draymond_green_height, tim_duncan_height)
weights <- c(steph_curry_weight, draymond_green_weight, tim_duncan_weight)
X3PA <- c(steph_curry_3PA, draymond_green_3PA, tim_duncan_3PA)
X3PP <- c(steph_curry_3PP, draymond_green_3PP, tim_duncan_3PP)
cs_players <- c("Stephen Curry", "Draymond Green", "Tim Duncan")
case_study_df <- data.frame(cs_players, X3PA, X3PP, heights, weights)

pdf("images/player_heights.pdf")
barplot(case_study_df$heights, names.arg = cs_players, ylim = c(0, 85), 
        las = 1, ylab = 'Height (inches)', main = 'Players Heights')
dev.off()
png("images/player_heights.png")
barplot(case_study_df$heights, names.arg = cs_players, ylim = c(0, 85), 
        las = 1, ylab = 'Height (inches)', main = 'Players Heights')
dev.off()

pdf("images/player_weights.pdf")
barplot(case_study_df$weights, names.arg= cs_players, las = 1, 
        ylab = 'Weight (lbs)', ylim = c(0, 250), main = 'Players Weights')
dev.off()
png("images/player_weights.png")
barplot(case_study_df$weights, names.arg= cs_players, las = 1, 
        ylab = 'Weight (lbs)', ylim = c(0, 250), main = 'Players Weights')
dev.off()

pdf("images/3pt_attempts.pdf")
barplot(case_study_df$X3PA, names.arg = case_study_df$cs_players, las = 1, 
        ylim = c(0, 10), ylab = '3-Pt Attempts', 
        main = '3-Pt Attempts per Game')
dev.off()
png("images/3pt_attempts.png")
barplot(case_study_df$X3PA, names.arg = case_study_df$cs_players, las = 1, 
        ylim = c(0, 10), ylab = '3-Pt Attempts', 
        main = '3-Pt Attempts per Game')
dev.off()

pdf("images/3pt_percent.pdf")
barplot(case_study_df$X3PP, names.arg = case_study_df$cs_players, las = 1, 
        ylim = c(0, 50), ylab = '3-Pt %', main = '3-Pt Percentage per Game')
dev.off()
png("images/3pt_percent.png")
barplot(case_study_df$X3PP, names.arg = case_study_df$cs_players, las = 1, 
        ylim = c(0, 50), ylab = '3-Pt %', main = '3-Pt Percentage per Game')
dev.off()

## ---- Case Study Visualization ----

barplot(case_study_df$heights, names.arg = cs_players, ylim = c(0, 85), las = 1,
        ylab = 'Height (inches)', main = 'Players Heights')
barplot(case_study_df$weights, names.arg= cs_players, las = 1, ylab = 'Weight (lbs)',
        ylim = c(0, 250), main = 'Players Weights')
barplot(case_study_df$X3PA, names.arg = case_study_df$cs_players, las = 1, 
        ylim = c(0, 10), ylab = '3-Pt Attempts', main = '3-Pt Attempts per Game')
barplot(case_study_df$X3PP, names.arg = case_study_df$cs_players, las = 1, 
        ylim = c(0, 50), ylab = '3-Pt %', main = '3-Pt Percentage per Game')
