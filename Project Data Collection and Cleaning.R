library(XML)

# Data Frame of NBA Champions
url.champs <- 'https://www.ticketcity.com/nba/nba-finals-tickets/nba-finals-champions.html'
download.file(url, 'rawdata/champions.html')
nba.champions <- readHTMLTable('rawdata/champions.html')
nba.champions <- as.data.frame(nba.champions[[2]])
nba.champions[] <- lapply(nba.champions, as.character)
colnames(nba.champions) <- nba.champions[1, ]
nba.champions <- nba.champions[-1, ]
## Cut this down to champions from 1995 - 2015

# Player heights
url.player_height <- 'http://www.draftexpress.com/nba-draft-history/?syear=1995'
download.file(url.player_height, 'rawdata/player_heights1995.html')
players <- readHTMLTable('rawdata/player_heights1995.html')
players <- as.data.frame(players[[9]])
players["year"] = 1995
players <- players[c("Name", "Height", "Weight", "year")]

for (i in 1996:2015) {
  url.player_height <- paste0('http://www.draftexpress.com/nba-draft-history/?syear=', i)
  download.file(url.player_height, paste0('rawdata/player_heights', i, '.html'))
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
