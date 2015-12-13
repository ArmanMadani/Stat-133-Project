# Data Cleaning and Preparation from .html files to .csv files

library(XML)

# Data Cleaning for Champions.html
nba_champions <- readHTMLTable('rawdata/champions.html')
nba_champions <- as.data.frame(nba_champions[[2]])
nba_champions[] <- lapply(nba_champions, as.character)
colnames(nba_champions) <- c('Year', 'Champion', 'Score', 'Opponent')
nba_champions <- nba_champions[-1, ]
write.csv(nba_champions, 'data/champions.csv')

# Getting the statistics for the champions
champion_stats <- c()
nba_champions$Champion[nba_champions$Year==1995]
for (i in 1:21) {
  file.path <- paste0('data/leagues_NBA_', 1994 + i, '_team.csv')
  files <- read.csv(file.path)
  champion_stats[[i]] <- 
    files[c("Team", "FGA", "FGP", "X3PA", "X3PP", "years")]
}
for (i in 1:21){
  years <- 1994 + i
  champion <- nba_champions$Champion[nba_champions$Year==years]
  year_data <- champion_stats[[i]]
  year_data$Team <- gsub('\\*', '', as.character(year_data$Team))
  champion_stats[[i]] <- 
    year_data[year_data$Team == champion | year_data$Team == "Average", ]
}
all_champs <- do.call(rbind, champion_stats)
all_champs <- all_champs[-seq(from = 2, to = nrow(all_champs), by = 2L), ]
write.csv(all_champs, file = "data/champ_data.csv")

# Drafted Players' Heights
to_inches <- function(height) {
  h <- strsplit(as.character(height), "[^0-9]")
  h <- grep("[0-9]", h[[1]], value = TRUE)
  ft <- as.numeric(h[1])
  inch <- as.numeric(h[2])
  return(ft * 12 + inch)
}

players <- readHTMLTable('rawdata/player_heights1995.html')
players <- as.data.frame(players[[9]])
players["Height"] <- unlist(lapply(players["Height"][[1]], to_inches))
players["Year"] = 1995
players["Average_Height"] = mean(players$Height, na.rm = TRUE)
players["Average_Weight"] = mean(as.numeric(levels(players$Weight)),
                                 na.rm = TRUE)
players <- players[c("Name", "Height", "Weight", 
                     "Average_Height", "Average_Weight", "Year")]

for (i in 1996:2015) {
  p <- readHTMLTable(paste0('rawdata/player_heights', i, '.html'))
  p <- as.data.frame(p[[9]])
  p["Height"] <- unlist(lapply(p["Height"][[1]], to_inches))
  p["Year"] = i
  p["Average_Height"] = mean(p$Height, na.rm = TRUE)
  p["Average_Weight"] = mean(as.numeric(levels(p$Weight)), na.rm = TRUE)
  p <- p[c("Name", "Height", "Weight", 
           "Average_Height", "Average_Weight", "Year")]
  players <- rbind(players, p)
}

write.csv(players, file = "data/players.csv")

# Cleaning data for champion rosters
champ <- readHTMLTable('rawdata/champion_stats1995.html')
champ <- as.data.frame(champ[[1]])
champ["Ht"] <- unlist(lapply(champ["Ht"][[1]], to_inches))
champ["Year"] = 1995
champ["Average_Height"] = mean(champ$Ht, na.rm = TRUE)
champ["Average_Weight"] = mean(as.numeric(levels(champ$Wt)), na.rm = TRUE)
champ <- champ[c("Player", "Pos", "Ht", "Wt", "Average_Height", 
                 "Average_Weight", "Year")]

for (i in 1996:2015) {
  ch <- readHTMLTable(paste0('rawdata/champion_stats', i, '.html'))
  ch <- as.data.frame(ch[[1]])
  ch["Ht"] <- unlist(lapply(ch["Ht"][[1]], to_inches))
  ch["Year"] = i
  ch["Average_Height"] = mean(ch$Ht, na.rm = TRUE)
  ch["Average_Weight"] = mean(as.numeric(levels(ch$Wt)), na.rm = TRUE)
  ch <- ch[c("Player", "Pos", "Ht", "Wt", "Average_Height", "Average_Weight", 
             "Year")]
  champ <- rbind(champ, ch)
}
write.csv(champ, file = "data/roster.csv")

# Case Study Player: Stephen Curry
steph_curry <- readHTMLTable('rawdata/steph_curry.html')
steph_curry <- as.data.frame(steph_curry[[11]])
steph_curry["Height w/o Shoes"] <- 
  unlist(lapply(steph_curry["Height w/o Shoes"], to_inches))
steph_curry["Height w/shoes"] <- 
  unlist(lapply(steph_curry["Height w/shoes"], to_inches))
steph_curry["Wingspan"] <- 
  unlist(lapply(steph_curry["Wingspan"], to_inches))
steph_curry["Standing Reach"] <- 
  unlist(lapply(steph_curry["Standing Reach"], to_inches))
write.csv(steph_curry, 'data/steph_curry.csv')

steph_curry_stats <- readHTMLTable('rawdata/steph_curry_career.html')
steph_curry_stats <- steph_curry_stats$per_game
write.csv(steph_curry_stats, 'data/steph_curry_stats.csv')

# Case Study Player: Draymond Green
draymond_green <- readHTMLTable('rawdata/draymond_green.html')
draymond_green <- as.data.frame(draymond_green[[11]])
draymond_green["Height w/o Shoes"] <- 
  unlist(lapply(draymond_green["Height w/o Shoes"], to_inches))
draymond_green["Height w/shoes"] <- 
  unlist(lapply(draymond_green["Height w/shoes"], to_inches))
draymond_green["Wingspan"] <- 
  unlist(lapply(draymond_green["Wingspan"], to_inches))
draymond_green["Standing Reach"] <- 
  unlist(lapply(draymond_green["Standing Reach"], to_inches))
write.csv(draymond_green, 'data/draymond_green.csv')

draymond_green_stats <- readHTMLTable('rawdata/draymond_green.html')
draymond_green_stats <- as.data.frame(draymond_green_stats[[12]])
write.csv(draymond_green_stats, 'data/draymond_green_stats.csv')

# Case Study Player: Tim Duncan
tim_duncan <- readHTMLTable('rawdata/tim_duncan.html')
tim_duncan <- as.data.frame(tim_duncan[[11]])
tim_duncan["Height w/o Shoes"] <- 
  unlist(lapply(tim_duncan["Height w/o Shoes"], to_inches))
tim_duncan["Height w/shoes"] <- 
  unlist(lapply(tim_duncan["Height w/shoes"], to_inches))
tim_duncan["Wingspan"] <- unlist(lapply(tim_duncan["Wingspan"], to_inches))
tim_duncan["Standing Reach"] <- 
  unlist(lapply(tim_duncan["Standing Reach"], to_inches))
write.csv(tim_duncan, 'data/tim_duncan.csv')

tim_duncan_stats <- readHTMLTable('rawdata/tim_duncan.html')
tim_duncan_stats <- as.data.frame(tim_duncan_stats[[12]])
write.csv(tim_duncan_stats, 'data/tim_duncan_stats.csv')

# Case Study Player: Shaq
shaq <- readHTMLTable('rawdata/shaq.html')
shaq <- as.data.frame(shaq[[11]])
shaq["Height w/o Shoes"] <- unlist(lapply(shaq["Height w/o Shoes"], to_inches))
shaq["Height w/shoes"] <- unlist(lapply(shaq["Height w/shoes"], to_inches))
shaq["Wingspan"] <- unlist(lapply(shaq["Wingspan"], to_inches))
shaq["Standing Reach"] <- unlist(lapply(shaq["Standing Reach"], to_inches))
write.csv(shaq, 'data/shaq.csv')

shaq_stats <- readHTMLTable('rawdata/shaq.html')
shaq_stats <- as.data.frame(shaq_stats[[12]])
write.csv(shaq_stats, 'data/shaq_stats.csv')
