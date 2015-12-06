library(XML)

# Data Frame of NBA Champions
url.champs <- 'https://www.ticketcity.com/nba/nba-finals-tickets/nba-finals-champions.html'
download.file(url, '~/Desktop/Stat 133 Project/Raw Data/champions.html')
nba.champions <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/champions.html')
nba.champions <- as.data.frame(nba.champions[[2]])
nba.champions[] <- lapply(nba.champions, as.character)
colnames(nba.champions) <- nba.champions[1, ]
nba.champions <- nba.champions[-1, ]
## Cut this down to champions from 1995 - 2015
