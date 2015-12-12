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
  ft <- as.numeric(h[[1]][1])
  inch <- as.numeric(h[[1]][2])
  return(ft * 12 + inch)
}

players <- readHTMLTable('rawdata/player_heights1995.html')
players <- as.data.frame(players[[9]])
players["Height"] <- unlist(lapply(players["Height"][[1]], to_inches))
players["Year"] = 1995
players["Average Height"] = mean(players$Height, na.rm = TRUE)
players["Average Weight"] = mean(as.numeric(levels(players$Weight)), na.rm = TRUE)
players <- players[c("Name", "Height", "Weight", 
                     "Average Height", "Average Weight", "Year")]

for (i in 1996:2015) {
  p <- readHTMLTable(paste0('rawdata/player_heights', i, '.html'))
  p <- as.data.frame(p[[9]])
  p["Height"] <- unlist(lapply(p["Height"][[1]], to_inches))
  p["Year"] = i
  p["Average Height"] = mean(p$Height, na.rm = TRUE)
  p["Average Weight"] = mean(as.numeric(levels(p$Weight)), na.rm = TRUE)
  p <- p[c("Name", "Height", "Weight", 
           "Average Height", "Average Weight", "Year")]
  players <- rbind(players, p)
}

write.csv(players, file = "data/players.csv")

# Cleaning data for champion rosters
champ <- readHTMLTable('rawdata/champion_stats1995.html')
champ <- as.data.frame(champ[[1]])
champ["Ht"] <- unlist(lapply(champ["Ht"][[1]], to_inches))
champ["Year"] = 1995
champ["Average Height"] = mean(champ$Ht, na.rm = TRUE)
champ["Average Weight"] = mean(as.numeric(levels(champ$Wt)), na.rm = TRUE)
champ <- champ[c("Player", "Pos", "Ht", "Wt", "Average Height", "Average Weight", "Year")]

for (i in 1996:2015) {
  ch <- readHTMLTable(paste0('rawdata/champion_stats', i, '.html'))
  ch <- as.data.frame(ch[[1]])
  ch["Ht"] <- unlist(lapply(ch["Ht"][[1]], to_inches))
  ch["Year"] = i
  ch["Average Height"] = mean(ch$Ht, na.rm = TRUE)
  ch["Average Weight"] = mean(as.numeric(levels(ch$Wt)), na.rm = TRUE)
  ch <- ch[c("Player", "Pos", "Ht", "Wt", "Average Height", "Average Weight", "Year")]
  champ <- rbind(champ, ch)
}

write.csv(champ, file = "data/roster.csv")