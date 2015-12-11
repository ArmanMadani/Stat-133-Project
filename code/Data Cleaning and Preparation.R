library(XML)

# Data Cleaning for Champions.html
nba_champions <- readHTMLTable('rawdata/Champions.html')
nba_champions <- as.data.frame(nba_champions[[2]])
nba_champions <- lapply(nba_champions, as.character)
nba_champions <- as.data.frame(nba_champions)
colnames(nba_champions) <- c('Year', 'Champion', 'Score', 'Opponent')
nba_champions <- nba_champions[-1, ]
write.csv(nba_champions, 'data/Champions.csv')

