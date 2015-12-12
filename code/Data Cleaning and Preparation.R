library(XML)

# Data Cleaning for Champions.html
nba_champions <- readHTMLTable('rawdata/Champions.html')
nba_champions <- as.data.frame(nba_champions[[2]])
nba_champions[] <- lapply(nba_champions, as.character)
colnames(nba_champions) <- c('Year', 'Champion', 'Score', 'Opponent')
nba_champions <- nba_champions[-1, ]
write.csv(nba_champions, 'data/Champions.csv')

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
players <- readHTMLTable('rawdata/player_heights1995.html')
players <- as.data.frame(players[[9]])
players["year"] = 1995
players <- players[c("Name", "Height", "Weight", "year")]

for (i in 1996:2015) {
  p <- readHTMLTable(paste0('rawdata/player_heights', i, '.html'))
  p <- as.data.frame(p[[9]])
  p["year"] = i
  p <- p[c("Name", "Height", "Weight", "year")]
  players <- rbind(players, p)
}

to_inches <- function(height) {
  h <- strsplit(as.character(height), "[^0-9]")
  ft <- as.numeric(h[[1]][1])
  inch <- as.numeric(h[[1]][2])
  return(ft * 12 + inch)
}

players["Height"] <- unlist(lapply(players["Height"][[1]], to_inches))

write.csv(players, file = "data/players.csv")
