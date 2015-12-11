## File for Initializing Project ##

# Initialize subdirectories
dir.create("code")
dir.create("data")
dir.create("images")
dir.create("rawdata")
dir.create("report")
dir.create("resources")

# Download data for champions
url_champs <- 
  'https://www.ticketcity.com/nba/nba-finals-tickets/nba-finals-champions.html'
download.file(url.champs, "rawdata/Champions.html")

# Download data for drafted player heights
for (i in 1995:2015) {
  url_p_height <- 
    paste0('http://www.draftexpress.com/nba-draft-history/?syear=', i)
  download.file(url.p.height, paste0('rawdata/player_heights', i, '.html'))
}

# Download data for championship team stats
for (i in 1996:2015) {
  url_championship_stats <- 
    paste0('http://www.basketball-reference.com/leagues/NBA_', i, '.html')
  download.file(url_championship_stats, paste0('rawdata/championship_stats', i, '.html'))
}

# Download data for championship lineups

# Download data for Case Study Players