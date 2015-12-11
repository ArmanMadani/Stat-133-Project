# Data Frame of NBA Champions
library(XML)
nba.champions <- readHTMLTable("../rawdata/Champions.html")
nba.champions <- as.data.frame(nba.champions[[2]])
nba.champions[] <- lapply(nba.champions, as.character)
colnames(nba.champions) <- nba.champions[1, ]
nba.champions <- nba.champions[-1, ]


# Getting the statistics for the champion team and the league average
champion.stats <- c()
nba.champions$Champion[nba.champions$Year==1995]
for (i in 1:21){
  file.path <- paste0("../data/leagues_NBA_", 1994 + i, "_team.csv")
  files <- read.csv(file.path)
  champion.stats[[i]] <- 
    files[c("Team", "FGA", "FGP", "X3PA", "X3PP", "years")]
}

for (i in 1:21){
  YEARS <- 1994 + i
  Champion <- nba.champions$Champion[nba.champions$Year==YEARS]
  yeardata <- champion.stats[[i]]
  yeardata$Team <- gsub('\\*', '', as.character(yeardata$Team))
  champion.stats[[i]] <- 
    yeardata[yeardata$Team == Champion | yeardata$Team == "Average", ]
}

all.champs <- do.call(rbind, champion.stats)
all.champs <- all.champs[-seq(from = 2, to = nrow(all.champs), by = 2L), ]
write.csv(all.champs, file = "../data/champdata.csv")

# Player heights
players <- readHTMLTable('../rawdata/player_heights1995.html')
players <- as.data.frame(players[[9]])
players["year"] = 1995
players <- players[c("Name", "Height", "Weight", "year")]

for (i in 1996:2015) {
  p <- readHTMLTable(paste0('../rawdata/player_heights', i, '.html'))
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

write.csv(players, file = "../data/players.csv")
